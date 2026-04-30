import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import { executeQuery, executeMutation } from './data_connect';

interface CreateAppointmentRequest {
  businessId: string;
  locationId: string;
  clientId: string;
  serviceId: string;
  employeeId: string;
  startTime: string; // ISO timestamp
  endTime: string;   // ISO timestamp
  paymentToken?: string;
}

interface OverlapCheckResult {
  appointments: { id: string }[];
}

interface AppointmentInsertResult {
  appointment_insert: { id: string };
}

const kCheckOverlap = `
  query($employeeId: UUID!, $startTime: Timestamp!, $endTime: Timestamp!) {
    appointments(where: {
      employeeId: { eq: $employeeId }
      startTime: { lt: $endTime }
      endTime: { gt: $startTime }
      status: { in: [PENDING, CONFIRMED] }
    }) { id }
  }
`;

const kInsertAppointment = `
  mutation(
    $businessId: UUID!, $locationId: UUID!, $clientId: UUID!,
    $serviceId: UUID!, $employeeId: UUID!,
    $startTime: Timestamp!, $endTime: Timestamp!, $paymentToken: String
  ) {
    appointment_insert(data: {
      businessId: $businessId
      locationId: $locationId
      clientId: $clientId
      serviceId: $serviceId
      employeeId: $employeeId
      startTime: $startTime
      endTime: $endTime
      paymentToken: $paymentToken
    }) { id }
  }
`;

const kDeleteAppointment = `
  mutation($id: UUID!) {
    appointment_delete(id: $id)
  }
`;

export const createAppointment = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { businessId, locationId, clientId, serviceId, employeeId, startTime, endTime, paymentToken } =
      request.data as CreateAppointmentRequest;

    if (!businessId || !locationId || !clientId || !serviceId || !employeeId || !startTime || !endTime) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    // Verify the authenticated client matches the clientId in the request
    if (!request.auth || request.auth.uid !== clientId) {
      throw new HttpsError('permission-denied', 'Unauthorized');
    }

    const overlapVars = { employeeId, startTime, endTime };

    // Step 1: pre-check — fast path for the non-concurrent case
    const preCheck = await executeQuery<OverlapCheckResult>(kCheckOverlap, overlapVars);
    if (preCheck.appointments.length > 0) {
      throw new HttpsError('already-exists', 'Time slot is no longer available');
    }

    // Step 2: insert
    const insertResult = await executeMutation<AppointmentInsertResult>(
      kInsertAppointment,
      { businessId, locationId, clientId, serviceId, employeeId, startTime, endTime, paymentToken: paymentToken ?? null },
    );
    const appointmentId = insertResult.appointment_insert.id;

    // Step 3: post-check — catches the concurrent race condition window
    const postCheck = await executeQuery<OverlapCheckResult>(kCheckOverlap, overlapVars);
    const conflicts = postCheck.appointments.filter((a) => a.id !== appointmentId);

    if (conflicts.length > 0) {
      // Another appointment snuck in — roll back ours
      await executeMutation(kDeleteAppointment, { id: appointmentId });
      throw new HttpsError('already-exists', 'Time slot is no longer available');
    }

    return { appointmentId };
  },
);
