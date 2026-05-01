import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/event_access_request.dart';
import 'package:samby/domain/entities/event_appointment.dart';

abstract class EventRepository {
  void getBandEvents(
    String bandId, {
    required Function(List<Event> events, AppError? error) onComplete,
  });

  void getEventDetail(
    String eventId, {
    required Function(Event? event, AppError? error) onComplete,
  });

  void createEvent({
    required String bandId,
    required String title,
    required String description,
    required String imageUrl,
    String? startDate,
    String? endDate,
    required bool freeEntry,
    String? entryCondition,
    required String createdBy,
    required Function(String? eventId, AppError? error) onComplete,
  });

  void updateEventStatus({
    required String eventId,
    required String status,
    required String updatedAt,
    required Function(AppError? error) onComplete,
  });

  void addEventMember(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  });

  void removeEventMember(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  });

  void requestEventAccess(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  });

  void getEventMember(
    String eventId,
    String memberId, {
    required Function(EventAccessRequest? request, AppError? error) onComplete,
  });

  void resolveEventAccess(
    String eventMemberId,
    String status,
    String resolvedBy,
    String resolvedAt, {
    required Function(AppError? error) onComplete,
  });

  void createEventAppointment({
    required String eventId,
    required String title,
    required String description,
    required String eventDate,
    String? endDate,
    required String createdBy,
    required Function(AppError? error) onComplete,
  });

  void getMemberEvents(
    String memberId, {
    required Function(List<Event> events, AppError? error) onComplete,
  });

  void getEventAppointmentDetail(
    String appointmentId, {
    required Function(EventAppointment? appointment, AppError? error) onComplete,
  });
}
