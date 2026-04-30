import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import { executeQuery } from './data_connect';

interface GetAvailableSlotsRequest {
  businessId: string;
  locationId: string;
  employeeId: string;
  serviceId: string;
  date: string; // "YYYY-MM-DD"
}

interface BusinessResult {
  business: { slotIntervalMinutes: number } | null;
}

interface ServiceResult {
  service: { duration: number } | null;
}

interface EmployeeScheduleRow {
  dayOfWeek: number;
  startTime: string;
  endTime: string;
  afternoonStartTime: string | null;
  afternoonEndTime: string | null;
}

interface EmployeeExceptionRow {
  startTime: string;
  endTime: string;
}

interface EmployeeResult {
  employee: {
    paddingMinutes: number;
    employeeSchedules_on_employee: EmployeeScheduleRow[];
    employeeScheduleExceptions_on_employee: EmployeeExceptionRow[];
  } | null;
}

interface LocationDayScheduleRow {
  dayOfWeek: number;
  openTime: string;
  closeTime: string;
  afternoonOpenTime: string | null;
  afternoonCloseTime: string | null;
}

interface LocationExceptionRow {
  startTime: string;
  endTime: string;
}

interface LocationResult {
  locationDaySchedules: LocationDayScheduleRow[];
  locationScheduleExceptions: LocationExceptionRow[];
}

interface AppointmentRow {
  startTime: string;
  endTime: string;
}

interface AppointmentsResult {
  appointments: AppointmentRow[];
}

interface TimeRange {
  start: Date;
  end: Date;
}

function parseScheduleTime(baseDate: Date, timeStr: string): Date {
  const [h, m] = timeStr.split(':').map(Number);
  return new Date(Date.UTC(
    baseDate.getUTCFullYear(),
    baseDate.getUTCMonth(),
    baseDate.getUTCDate(),
    h, m, 0, 0,
  ));
}

function rangesOverlap(a: TimeRange, b: TimeRange): boolean {
  return a.start < b.end && a.end > b.start;
}

function generateSlots(
  workingPeriods: TimeRange[],
  blockedRanges: TimeRange[],
  serviceDurationMs: number,
  slotIntervalMs: number,
): string[] {
  const slots: string[] = [];
  for (const period of workingPeriods) {
    const lastValidStart = period.end.getTime() - serviceDurationMs;
    let t = period.start.getTime();
    while (t <= lastValidStart) {
      const candidate: TimeRange = { start: new Date(t), end: new Date(t + serviceDurationMs) };
      if (!blockedRanges.some((blocked) => rangesOverlap(candidate, blocked))) {
        slots.push(new Date(t).toISOString());
      }
      t += slotIntervalMs;
    }
  }
  return slots;
}

export const getAvailableSlots = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { businessId, locationId, employeeId, serviceId, date } =
      request.data as GetAvailableSlotsRequest;

    if (!businessId || !locationId || !employeeId || !serviceId || !date) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    const baseDate = new Date(date + 'T00:00:00Z');
    if (isNaN(baseDate.getTime())) {
      throw new HttpsError('invalid-argument', 'Invalid date format. Expected YYYY-MM-DD');
    }

    const dayStart = baseDate.toISOString();
    const dayEnd = new Date(baseDate.getTime() + 86_400_000).toISOString();

    // Convert JS day (0=Sun…6=Sat) to ISO weekday (1=Mon…7=Sun)
    const jsDay = baseDate.getUTCDay();
    const isoWeekday = jsDay === 0 ? 7 : jsDay;

    const [businessResult, serviceResult, employeeResult, locationResult, appointmentsResult] =
      await Promise.all([
        executeQuery<BusinessResult>(
          `query($id: UUID!) { business(id: $id) { slotIntervalMinutes } }`,
          { id: businessId },
        ),
        executeQuery<ServiceResult>(
          `query($id: UUID!) { service(id: $id) { duration } }`,
          { id: serviceId },
        ),
        executeQuery<EmployeeResult>(
          `query($id: UUID!) {
            employee(id: $id) {
              paddingMinutes
              employeeSchedules_on_employee {
                dayOfWeek startTime endTime afternoonStartTime afternoonEndTime
              }
              employeeScheduleExceptions_on_employee {
                startTime endTime
              }
            }
          }`,
          { id: employeeId },
        ),
        executeQuery<LocationResult>(
          `query($locationId: UUID!, $dayStart: Timestamp!, $dayEnd: Timestamp!) {
            locationDaySchedules(where: { locationId: { eq: $locationId } }) {
              dayOfWeek openTime closeTime afternoonOpenTime afternoonCloseTime
            }
            locationScheduleExceptions(where: {
              locationId: { eq: $locationId }
              startTime: { lt: $dayEnd }
              endTime: { gt: $dayStart }
            }) {
              startTime endTime
            }
          }`,
          { locationId, dayStart, dayEnd },
        ),
        executeQuery<AppointmentsResult>(
          `query($employeeId: UUID!, $dayStart: Timestamp!, $dayEnd: Timestamp!) {
            appointments(where: {
              employeeId: { eq: $employeeId }
              startTime: { lt: $dayEnd }
              endTime: { gt: $dayStart }
              status: { in: [PENDING, CONFIRMED] }
            }) {
              startTime endTime
            }
          }`,
          { employeeId, dayStart, dayEnd },
        ),
      ]);

    // 1. Location must be open on this weekday
    const locationDaySchedule = locationResult.locationDaySchedules.find(
      (s) => s.dayOfWeek === isoWeekday,
    );
    if (!locationDaySchedule) return { slots: [] };

    // 2. No full-day location exception covering this date
    if (locationResult.locationScheduleExceptions.length > 0) return { slots: [] };

    // 3. Employee must have a schedule for this weekday
    const employeeData = employeeResult.employee;
    if (!employeeData) return { slots: [] };

    const empDaySchedule = employeeData.employeeSchedules_on_employee.find(
      (s) => s.dayOfWeek === isoWeekday,
    );
    if (!empDaySchedule) return { slots: [] };

    const paddingMinutes = employeeData.paddingMinutes ?? 0;
    const slotIntervalMinutes = businessResult.business?.slotIntervalMinutes ?? 15;
    const serviceDurationMinutes = serviceResult.service?.duration;

    if (!serviceDurationMinutes || serviceDurationMinutes <= 0) return { slots: [] };

    // Build working periods from employee schedule
    const workingPeriods: TimeRange[] = [
      {
        start: parseScheduleTime(baseDate, empDaySchedule.startTime),
        end: parseScheduleTime(baseDate, empDaySchedule.endTime),
      },
    ];
    if (empDaySchedule.afternoonStartTime && empDaySchedule.afternoonEndTime) {
      workingPeriods.push({
        start: parseScheduleTime(baseDate, empDaySchedule.afternoonStartTime),
        end: parseScheduleTime(baseDate, empDaySchedule.afternoonEndTime),
      });
    }

    // Build blocked ranges: appointments (+ padding) and employee exceptions overlapping this day
    const blockedRanges: TimeRange[] = [];

    for (const apt of appointmentsResult.appointments) {
      blockedRanges.push({
        start: new Date(apt.startTime),
        end: new Date(new Date(apt.endTime).getTime() + paddingMinutes * 60_000),
      });
    }

    for (const ex of employeeData.employeeScheduleExceptions_on_employee) {
      const exStart = new Date(ex.startTime);
      const exEnd = new Date(ex.endTime);
      // Only include exceptions that actually overlap this day
      if (exStart < new Date(dayEnd) && exEnd > new Date(dayStart)) {
        blockedRanges.push({ start: exStart, end: exEnd });
      }
    }

    const slots = generateSlots(
      workingPeriods,
      blockedRanges,
      serviceDurationMinutes * 60_000,
      slotIntervalMinutes * 60_000,
    );

    return { slots };
  },
);
