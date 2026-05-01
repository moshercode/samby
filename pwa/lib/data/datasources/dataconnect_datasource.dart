import 'dart:convert';

import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';

// ── Action types ──────────────────────────────────────────────────────────────

enum DataconnectActionType { query, mutation }

// ── Operation names ───────────────────────────────────────────────────────────

abstract class DataconnectOps {
  // Association
  static const String getAssociationByFounderEmail = 'GetAssociationByFounderEmail';
  static const String getAssociationBySubdomain = 'GetAssociationBySubdomain';
  static const String getAssociationConditions = 'GetAssociationConditions';
  static const String createAssociation = 'CreateAssociation';
  static const String createAssociationCondition = 'AddAssociationCondition';

  // Member
  static const String getMember = 'GetMember';
  static const String getAssociationMembers = 'GetAssociationMembers';
  static const String getMemberEvents = 'GetMemberEvents';
  static const String updateMemberApplication = 'UpdateMemberApplication';
  static const String resetMemberApplication = 'ResetMemberApplication';
  static const String updateMemberStatus = 'UpdateMemberStatus';
  static const String updateMemberRole = 'UpdateMemberRole';
  static const String updateMemberBlock = 'UpdateMemberBlock';
  static const String updateMemberNotes = 'UpdateMemberNotes';
  static const String createFounderMember = 'CreateFounderMember';
  static const String updateMemberFcmToken = 'UpdateMemberFcmToken';

  // Events
  static const String getAssociationEvents = 'GetAssociationEvents';
  static const String getEventDetail = 'GetEventDetail';
  static const String createEvent = 'CreateEvent';
  static const String addEventMember = 'AddEventMember';
  static const String removeEventMember = 'RemoveEventMember';
  static const String updateEventStatus = 'UpdateEventStatus';
  static const String requestEventAccess = 'RequestEventAccess';
  static const String resolveEventAccess = 'ResolveEventAccess';
  static const String getEventMember = 'GetEventMember';

  // Event Appointments
  static const String createEventAppointment = 'CreateEventAppointment';
  static const String getEventAppointmentDetail = 'GetEventAppointmentDetail';

  // Association
  static const String updateAssociation = 'UpdateAssociation';

  // Broadcasts
  static const String sendBroadcast = 'SendBroadcast';
}

// ── Parameter keys ────────────────────────────────────────────────────────────

abstract class DataconnectKeys {
  static const String id = 'id';
  static const String associationId = 'associationId';
  static const String memberId = 'memberId';
  static const String subdomain = 'subdomain';
  static const String founderEmail = 'founderEmail';
  static const String email = 'email';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String shortName = 'shortName';
  static const String primaryColor = 'primaryColor';
  static const String secondaryColor = 'secondaryColor';
  static const String type = 'type';
  static const String role = 'role';
  static const String status = 'status';
  static const String isBlocked = 'isBlocked';
  static const String resolvedBy = 'resolvedBy';
  static const String resolvedAt = 'resolvedAt';
  static const String internalNotes = 'internalNotes';
  static const String birthDate = 'birthDate';
  static const String idDoc = 'idDoc';
  static const String idDocImageUrl = 'idDocImageUrl';
  static const String guardianName = 'guardianName';
  static const String guardianIdDoc = 'guardianIdDoc';
  static const String guardianIdDocImageUrl = 'guardianIdDocImageUrl';
  static const String signatureUrl = 'signatureUrl';
  static const String conditionsAcceptedAt = 'conditionsAcceptedAt';
  static const String minorConditionsAcceptedAt = 'minorConditionsAcceptedAt';
  static const String requestedAt = 'requestedAt';
  static const String updatedAt = 'updatedAt';
  static const String token = 'token';
  static const String title = 'title';
  static const String description = 'description';
  static const String imageUrl = 'imageUrl';
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
  static const String eventDate = 'eventDate';
  static const String createdBy = 'createdBy';
  static const String eventId = 'eventId';
  static const String content = 'content';
  static const String sortOrder = 'sortOrder';
  static const String body = 'body';
  static const String sentBy = 'sentBy';
  static const String freeEntry = 'freeEntry';
  static const String entryCondition = 'entryCondition';
  static const String requireIdDoc = 'requireIdDoc';
  static const String requireIdDocImage = 'requireIdDocImage';
  static const String requireGuardian = 'requireGuardian';
  static const String appointmentId = 'appointmentId';
}

// ── Response data keys ────────────────────────────────────────────────────────

abstract class DataconnectResponseKeys {
  static const String association = 'association';
  static const String associationConditions = 'associationConditions';
  static const String member = 'member';
  static const String members = 'members';
  static const String event = 'event';
  static const String events = 'events';
  static const String eventMembers = 'eventMembers';
  static const String eventAppointment = 'eventAppointment';
}

// ── Datasource ────────────────────────────────────────────────────────────────

class DataconnectDatasource {
  // Variables

  final FirebaseDataConnect dc;

  // Constructor

  DataconnectDatasource({required this.dc});

  // Public methods

  Future<Map<String, dynamic>?> executeQuery(
    String operationName, {
    Map<String, dynamic>? variables,
  }) async {
    return _execute(DataconnectActionType.query, operationName, variables: variables);
  }

  Future<Map<String, dynamic>?> executeMutation(
    String operationName, {
    Map<String, dynamic>? variables,
  }) async {
    return _execute(DataconnectActionType.mutation, operationName, variables: variables);
  }

  // Private methods

  Future<Map<String, dynamic>?> _execute(
    DataconnectActionType type,
    String operationName, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      Log.debug('DataconnectDatasource.$type: $operationName, vars: $variables');

      final Deserializer<Map<String, dynamic>?> deserializer =
          (String data) => jsonDecode(data) as Map<String, dynamic>?;
      final Serializer<Map<String, dynamic>> serializer =
          (Map<String, dynamic> vars) => jsonEncode(vars);

      OperationResult<Map<String, dynamic>?, Map<String, dynamic>> result;
      if (type == DataconnectActionType.query) {
        result = await dc
            .query<Map<String, dynamic>?, Map<String, dynamic>>(
              operationName, deserializer, serializer, variables)
            .execute();
      } else {
        result = await dc
            .mutation<Map<String, dynamic>?, Map<String, dynamic>>(
              operationName, deserializer, serializer, variables)
            .execute();
      }
      return result.data;
    } on DataConnectError catch (e) {
      Log.error('DataconnectDatasource error on $operationName: $e');
      throw DataError(e.message ?? operationName);
    } catch (e) {
      Log.error('DataconnectDatasource unknown error on $operationName: $e');
      throw DataError('Unknown error on $operationName');
    }
  }
}
