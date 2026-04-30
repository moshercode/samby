import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/event_access_request.dart';
import 'package:samby/domain/entities/event_appointment.dart';
import 'package:samby/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final DataconnectDatasource _datasource;

  EventRepositoryImpl(this._datasource);

  @override
  void getAssociationEvents(
    String associationId, {
    required Function(List<Event> events, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getAssociationEvents,
        variables: {DataconnectKeys.associationId: associationId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.events] as List<dynamic>? ?? <dynamic>[];
      final List<Event> events =
          raw.map((dynamic e) => Event.fromMap(e as Map<String, dynamic>)).toList();
      onComplete(events, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.getAssociationEvents: $e');
      onComplete(<Event>[], e);
    } catch (e) {
      Log.error('EventRepositoryImpl.getAssociationEvents unknown: $e');
      onComplete(<Event>[], DataError(e.toString()));
    }
  }

  @override
  void getEventDetail(
    String eventId, {
    required Function(Event? event, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getEventDetail,
        variables: {DataconnectKeys.id: eventId},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.event] as Map<String, dynamic>?;
      final Event? event = raw != null ? Event.fromMap(raw) : null;
      onComplete(event, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.getEventDetail: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('EventRepositoryImpl.getEventDetail unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void createEvent({
    required String associationId,
    required String title,
    required String description,
    required String imageUrl,
    String? startDate,
    String? endDate,
    required bool freeEntry,
    String? entryCondition,
    required String createdBy,
    required Function(String? eventId, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeMutation(
        DataconnectOps.createEvent,
        variables: {
          DataconnectKeys.associationId: associationId,
          DataconnectKeys.title: title,
          DataconnectKeys.description: description,
          DataconnectKeys.imageUrl: imageUrl,
          if (startDate != null) DataconnectKeys.startDate: startDate,
          if (endDate != null) DataconnectKeys.endDate: endDate,
          DataconnectKeys.freeEntry: freeEntry,
          if (entryCondition != null) DataconnectKeys.entryCondition: entryCondition,
          DataconnectKeys.createdBy: createdBy,
        },
      );
      final String? id =
          (data?['event_insert'] as Map<String, dynamic>?)?['id'] as String?;
      onComplete(id, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.createEvent: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('EventRepositoryImpl.createEvent unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void updateEventStatus({
    required String eventId,
    required String status,
    required String updatedAt,
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateEventStatus,
        variables: {
          DataconnectKeys.id: eventId,
          DataconnectKeys.status: status,
          DataconnectKeys.updatedAt: updatedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.updateEventStatus: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.updateEventStatus unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void addEventMember(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.addEventMember,
        variables: {
          DataconnectKeys.eventId: eventId,
          DataconnectKeys.memberId: memberId,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.addEventMember: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.addEventMember unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void removeEventMember(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.removeEventMember,
        variables: {
          DataconnectKeys.eventId: eventId,
          DataconnectKeys.memberId: memberId,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.removeEventMember: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.removeEventMember unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void requestEventAccess(
    String eventId,
    String memberId, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.requestEventAccess,
        variables: {
          DataconnectKeys.eventId: eventId,
          DataconnectKeys.memberId: memberId,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.requestEventAccess: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.requestEventAccess unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void getEventAccessRequest(
    String eventId,
    String memberId, {
    required Function(EventAccessRequest? request, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getEventAccessRequest,
        variables: {
          DataconnectKeys.eventId: eventId,
          DataconnectKeys.memberId: memberId,
        },
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.eventAccessRequests] as List<dynamic>? ?? <dynamic>[];
      final EventAccessRequest? request = raw.isNotEmpty
          ? EventAccessRequest.fromMap(raw.first as Map<String, dynamic>)
          : null;
      onComplete(request, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.getEventAccessRequest: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('EventRepositoryImpl.getEventAccessRequest unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void resolveEventAccess(
    String requestId,
    String status,
    String resolvedBy,
    String resolvedAt, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.resolveEventAccess,
        variables: {
          DataconnectKeys.id: requestId,
          DataconnectKeys.status: status,
          DataconnectKeys.resolvedBy: resolvedBy,
          DataconnectKeys.resolvedAt: resolvedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.resolveEventAccess: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.resolveEventAccess unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void createEventAppointment({
    required String eventId,
    required String title,
    required String description,
    required String eventDate,
    String? endDate,
    required String createdBy,
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.createEventAppointment,
        variables: {
          DataconnectKeys.eventId: eventId,
          DataconnectKeys.title: title,
          DataconnectKeys.description: description,
          DataconnectKeys.eventDate: eventDate,
          if (endDate != null) DataconnectKeys.endDate: endDate,
          DataconnectKeys.createdBy: createdBy,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.createEventAppointment: $e');
      onComplete(e);
    } catch (e) {
      Log.error('EventRepositoryImpl.createEventAppointment unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void getMemberEvents(
    String memberId, {
    required Function(List<Event> events, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getMemberEvents,
        variables: {DataconnectKeys.memberId: memberId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.eventMembers] as List<dynamic>? ?? <dynamic>[];
      final List<Event> events = raw.map((dynamic m) {
        final Map<String, dynamic> eventMap =
            (m as Map<String, dynamic>)['event'] as Map<String, dynamic>;
        return Event.fromMap(eventMap);
      }).toList();
      onComplete(events, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.getMemberEvents: $e');
      onComplete(<Event>[], e);
    } catch (e) {
      Log.error('EventRepositoryImpl.getMemberEvents unknown: $e');
      onComplete(<Event>[], DataError(e.toString()));
    }
  }

  @override
  void getEventAppointmentDetail(
    String appointmentId, {
    required Function(EventAppointment? appointment, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getEventAppointmentDetail,
        variables: {DataconnectKeys.id: appointmentId},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.eventAppointment] as Map<String, dynamic>?;
      final EventAppointment? appointment =
          raw != null ? EventAppointment.fromMap(raw) : null;
      onComplete(appointment, null);
    } on AppError catch (e) {
      Log.error('EventRepositoryImpl.getEventAppointmentDetail: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('EventRepositoryImpl.getEventAppointmentDetail unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }
}
