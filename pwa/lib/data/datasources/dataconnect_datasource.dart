import 'dart:convert';

import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';

// ── Action types ──────────────────────────────────────────────────────────────

enum DataconnectActionType { query, mutation }

// ── Operation names ───────────────────────────────────────────────────────────

abstract class DataconnectOps {
  // Association
  static const String getAssociationBySubdomain = 'GetAssociationBySubdomain';
  static const String getAssociationConditions = 'GetAssociationConditions';
  static const String createAssociation = 'CreateAssociation';

  // Membership
  static const String getMembership = 'GetMembership';
  static const String getManagerMemberships = 'GetManagerMemberships';
  static const String getAssociationMembers = 'GetAssociationMembers';
  static const String createAppUser = 'CreateAppUser';
  static const String getUserByEmail = 'GetUserByEmail';
  static const String createMembership = 'CreateMembership';
  static const String createFounderMembership = 'CreateFounderMembership';
  static const String updateMembershipStatus = 'UpdateMembershipStatus';
  static const String updateMembershipRole = 'UpdateMembershipRole';
  static const String updateMembershipBlock = 'UpdateMembershipBlock';
  static const String updateMembershipNotes = 'UpdateMembershipNotes';
  static const String resetMembership = 'ResetMembership';

  // FCM
  static const String upsertFCMToken = 'UpsertFCMToken';

  // Events
  static const String getAssociationEvents = 'GetAssociationEvents';
  static const String getEventComments = 'GetEventComments';
  static const String createEvent = 'CreateEvent';
  static const String addEventImage = 'AddEventImage';
  static const String createEventComment = 'CreateEventComment';
  static const String deleteEventComment = 'DeleteEventComment';
  static const String sendBroadcast = 'SendBroadcast';
}

// ── Parameter keys ────────────────────────────────────────────────────────────

abstract class DataconnectKeys {
  static const String id = 'id';
  static const String associationId = 'associationId';
  static const String userId = 'userId';
  static const String subdomain = 'subdomain';
  static const String email = 'email';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String shortName = 'shortName';
  static const String primaryColor = 'primaryColor';
  static const String secondaryColor = 'secondaryColor';
  static const String role = 'role';
  static const String status = 'status';
  static const String isBlocked = 'isBlocked';
  static const String resolvedBy = 'resolvedBy';
  static const String resolvedAt = 'resolvedAt';
  static const String internalNotes = 'internalNotes';
  static const String memberName = 'memberName';
  static const String memberBirthDate = 'memberBirthDate';
  static const String memberDNI = 'memberDNI';
  static const String memberDNIImageUrl = 'memberDNIImageUrl';
  static const String guardianName = 'guardianName';
  static const String guardianDNI = 'guardianDNI';
  static const String guardianDNIImageUrl = 'guardianDNIImageUrl';
  static const String signatureUrl = 'signatureUrl';
  static const String conditionsAcceptedAt = 'conditionsAcceptedAt';
  static const String minorConditionsAcceptedAt = 'minorConditionsAcceptedAt';
  static const String token = 'token';
  static const String title = 'title';
  static const String description = 'description';
  static const String eventDate = 'eventDate';
  static const String endDate = 'endDate';
  static const String createdBy = 'createdBy';
  static const String eventId = 'eventId';
  static const String imageUrl = 'imageUrl';
  static const String sortOrder = 'sortOrder';
  static const String content = 'content';
  static const String body = 'body';
  static const String sentBy = 'sentBy';
  static const String userName = 'userName';
}

// ── Response data keys ────────────────────────────────────────────────────────

abstract class DataconnectResponseKeys {
  static const String association = 'association';
  static const String associations = 'associations';
  static const String associationConditions = 'associationConditions';
  static const String associationMembership = 'associationMembership';
  static const String associationMemberships = 'associationMemberships';
  static const String appUsers = 'appUsers';
  static const String events = 'events';
  static const String eventComments = 'eventComments';
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
      dynamic result;
      if (type == DataconnectActionType.query) {
        result = await dc.query(operationName, variables: variables).execute();
      } else {
        result = await dc.mutation(operationName, variables: variables).execute();
      }
      final String jsonString = jsonEncode(result.data);
      return jsonDecode(jsonString) as Map<String, dynamic>?;
    } on DataConnectError catch (e) {
      Log.error('DataconnectDatasource error on $operationName: $e');
      throw DataError(e.message ?? operationName);
    } catch (e) {
      Log.error('DataconnectDatasource unknown error on $operationName: $e');
      throw DataError('Unknown error on $operationName');
    }
  }
}
