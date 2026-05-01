library samby;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'create_association.dart';

part 'update_association_images.dart';

part 'update_association.dart';

part 'add_association_condition.dart';

part 'delete_association_condition.dart';

part 'create_founder_member.dart';

part 'update_member_application.dart';

part 'reset_member_application.dart';

part 'update_member_status.dart';

part 'update_member_role.dart';

part 'update_member_block.dart';

part 'update_member_notes.dart';

part 'update_member_fcm_token.dart';

part 'create_event.dart';

part 'update_event_status.dart';

part 'add_event_member.dart';

part 'remove_event_member.dart';

part 'request_event_access.dart';

part 'resolve_event_access.dart';

part 'create_event_appointment.dart';

part 'send_broadcast.dart';

part 'get_association_by_founder_email.dart';

part 'get_association_by_subdomain.dart';

part 'get_member.dart';

part 'get_association_conditions.dart';

part 'get_association_members.dart';

part 'get_association_events.dart';

part 'get_event_detail.dart';

part 'get_member_events.dart';

part 'get_event_member.dart';

part 'get_event_appointment_detail.dart';



  enum EventStatus {
    
      ACTIVE,
    
      FINISHED,
    
      CANCELLED,
    
  }
  
  String eventStatusSerializer(EnumValue<EventStatus> e) {
    return e.stringValue;
  }
  EnumValue<EventStatus> eventStatusDeserializer(dynamic data) {
    switch (data) {
      
      case 'ACTIVE':
        return const Known(EventStatus.ACTIVE);
      
      case 'FINISHED':
        return const Known(EventStatus.FINISHED);
      
      case 'CANCELLED':
        return const Known(EventStatus.CANCELLED);
      
      default:
        return Unknown(data);
    }
  }
  

  enum MemberRole {
    
      MANAGER,
    
      MEMBER,
    
  }
  
  String memberRoleSerializer(EnumValue<MemberRole> e) {
    return e.stringValue;
  }
  EnumValue<MemberRole> memberRoleDeserializer(dynamic data) {
    switch (data) {
      
      case 'MANAGER':
        return const Known(MemberRole.MANAGER);
      
      case 'MEMBER':
        return const Known(MemberRole.MEMBER);
      
      default:
        return Unknown(data);
    }
  }
  



String enumSerializer(Enum e) {
  return e.name;
}



/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class SambyConnector {
  
  
  CreateAssociationVariablesBuilder createAssociation ({required String name, required String shortName, required String subdomain, required String primaryColor, required String secondaryColor, required String founderEmail, }) {
    return CreateAssociationVariablesBuilder(dataConnect, name: name,shortName: shortName,subdomain: subdomain,primaryColor: primaryColor,secondaryColor: secondaryColor,founderEmail: founderEmail,);
  }
  
  
  UpdateAssociationImagesVariablesBuilder updateAssociationImages ({required String id, required String logoUrl, required String iconUrl, }) {
    return UpdateAssociationImagesVariablesBuilder(dataConnect, id: id,logoUrl: logoUrl,iconUrl: iconUrl,);
  }
  
  
  UpdateAssociationVariablesBuilder updateAssociation ({required String id, required bool requireIdDoc, required bool requireIdDocImage, required bool requireGuardian, }) {
    return UpdateAssociationVariablesBuilder(dataConnect, id: id,requireIdDoc: requireIdDoc,requireIdDocImage: requireIdDocImage,requireGuardian: requireGuardian,);
  }
  
  
  AddAssociationConditionVariablesBuilder addAssociationCondition ({required String associationId, required String type, required String content, required int sortOrder, }) {
    return AddAssociationConditionVariablesBuilder(dataConnect, associationId: associationId,type: type,content: content,sortOrder: sortOrder,);
  }
  
  
  DeleteAssociationConditionVariablesBuilder deleteAssociationCondition ({required String id, }) {
    return DeleteAssociationConditionVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreateFounderMemberVariablesBuilder createFounderMember ({required String associationId, required String name, required String email, required Timestamp conditionsAcceptedAt, }) {
    return CreateFounderMemberVariablesBuilder(dataConnect, associationId: associationId,name: name,email: email,conditionsAcceptedAt: conditionsAcceptedAt,);
  }
  
  
  UpdateMemberApplicationVariablesBuilder updateMemberApplication ({required String id, required String name, required DateTime birthDate, required String idDoc, required String idDocImageUrl, required String signatureUrl, required Timestamp conditionsAcceptedAt, required Timestamp requestedAt, }) {
    return UpdateMemberApplicationVariablesBuilder(dataConnect, id: id,name: name,birthDate: birthDate,idDoc: idDoc,idDocImageUrl: idDocImageUrl,signatureUrl: signatureUrl,conditionsAcceptedAt: conditionsAcceptedAt,requestedAt: requestedAt,);
  }
  
  
  ResetMemberApplicationVariablesBuilder resetMemberApplication ({required String id, required String name, required DateTime birthDate, required String idDoc, required String idDocImageUrl, required String signatureUrl, required Timestamp conditionsAcceptedAt, required Timestamp requestedAt, }) {
    return ResetMemberApplicationVariablesBuilder(dataConnect, id: id,name: name,birthDate: birthDate,idDoc: idDoc,idDocImageUrl: idDocImageUrl,signatureUrl: signatureUrl,conditionsAcceptedAt: conditionsAcceptedAt,requestedAt: requestedAt,);
  }
  
  
  UpdateMemberStatusVariablesBuilder updateMemberStatus ({required String id, required String status, required String resolvedBy, required Timestamp resolvedAt, }) {
    return UpdateMemberStatusVariablesBuilder(dataConnect, id: id,status: status,resolvedBy: resolvedBy,resolvedAt: resolvedAt,);
  }
  
  
  UpdateMemberRoleVariablesBuilder updateMemberRole ({required String id, required MemberRole role, }) {
    return UpdateMemberRoleVariablesBuilder(dataConnect, id: id,role: role,);
  }
  
  
  UpdateMemberBlockVariablesBuilder updateMemberBlock ({required String id, required bool isBlocked, }) {
    return UpdateMemberBlockVariablesBuilder(dataConnect, id: id,isBlocked: isBlocked,);
  }
  
  
  UpdateMemberNotesVariablesBuilder updateMemberNotes ({required String id, required String internalNotes, }) {
    return UpdateMemberNotesVariablesBuilder(dataConnect, id: id,internalNotes: internalNotes,);
  }
  
  
  UpdateMemberFcmTokenVariablesBuilder updateMemberFcmToken ({required String id, required String token, required Timestamp updatedAt, }) {
    return UpdateMemberFcmTokenVariablesBuilder(dataConnect, id: id,token: token,updatedAt: updatedAt,);
  }
  
  
  CreateEventVariablesBuilder createEvent ({required String associationId, required String title, required String description, required String imageUrl, required bool freeEntry, required String createdBy, }) {
    return CreateEventVariablesBuilder(dataConnect, associationId: associationId,title: title,description: description,imageUrl: imageUrl,freeEntry: freeEntry,createdBy: createdBy,);
  }
  
  
  UpdateEventStatusVariablesBuilder updateEventStatus ({required String id, required EventStatus status, required Timestamp updatedAt, }) {
    return UpdateEventStatusVariablesBuilder(dataConnect, id: id,status: status,updatedAt: updatedAt,);
  }
  
  
  AddEventMemberVariablesBuilder addEventMember ({required String eventId, required String memberId, }) {
    return AddEventMemberVariablesBuilder(dataConnect, eventId: eventId,memberId: memberId,);
  }
  
  
  RemoveEventMemberVariablesBuilder removeEventMember ({required String eventId, required String memberId, }) {
    return RemoveEventMemberVariablesBuilder(dataConnect, eventId: eventId,memberId: memberId,);
  }
  
  
  RequestEventAccessVariablesBuilder requestEventAccess ({required String eventId, required String memberId, }) {
    return RequestEventAccessVariablesBuilder(dataConnect, eventId: eventId,memberId: memberId,);
  }
  
  
  ResolveEventAccessVariablesBuilder resolveEventAccess ({required String id, required String status, required String resolvedBy, required Timestamp resolvedAt, }) {
    return ResolveEventAccessVariablesBuilder(dataConnect, id: id,status: status,resolvedBy: resolvedBy,resolvedAt: resolvedAt,);
  }
  
  
  CreateEventAppointmentVariablesBuilder createEventAppointment ({required String eventId, required String title, required String description, required Timestamp eventDate, required String createdBy, }) {
    return CreateEventAppointmentVariablesBuilder(dataConnect, eventId: eventId,title: title,description: description,eventDate: eventDate,createdBy: createdBy,);
  }
  
  
  SendBroadcastVariablesBuilder sendBroadcast ({required String associationId, required String sentBy, required String title, required String body, }) {
    return SendBroadcastVariablesBuilder(dataConnect, associationId: associationId,sentBy: sentBy,title: title,body: body,);
  }
  
  
  GetAssociationByFounderEmailVariablesBuilder getAssociationByFounderEmail ({required String founderEmail, }) {
    return GetAssociationByFounderEmailVariablesBuilder(dataConnect, founderEmail: founderEmail,);
  }
  
  
  GetAssociationBySubdomainVariablesBuilder getAssociationBySubdomain ({required String subdomain, }) {
    return GetAssociationBySubdomainVariablesBuilder(dataConnect, subdomain: subdomain,);
  }
  
  
  GetMemberVariablesBuilder getMember ({required String memberId, }) {
    return GetMemberVariablesBuilder(dataConnect, memberId: memberId,);
  }
  
  
  GetAssociationConditionsVariablesBuilder getAssociationConditions ({required String associationId, }) {
    return GetAssociationConditionsVariablesBuilder(dataConnect, associationId: associationId,);
  }
  
  
  GetAssociationMembersVariablesBuilder getAssociationMembers ({required String associationId, }) {
    return GetAssociationMembersVariablesBuilder(dataConnect, associationId: associationId,);
  }
  
  
  GetAssociationEventsVariablesBuilder getAssociationEvents ({required String associationId, }) {
    return GetAssociationEventsVariablesBuilder(dataConnect, associationId: associationId,);
  }
  
  
  GetEventDetailVariablesBuilder getEventDetail ({required String eventId, }) {
    return GetEventDetailVariablesBuilder(dataConnect, eventId: eventId,);
  }
  
  
  GetMemberEventsVariablesBuilder getMemberEvents ({required String memberId, }) {
    return GetMemberEventsVariablesBuilder(dataConnect, memberId: memberId,);
  }
  
  
  GetEventMemberVariablesBuilder getEventMember ({required String eventId, required String memberId, }) {
    return GetEventMemberVariablesBuilder(dataConnect, eventId: eventId,memberId: memberId,);
  }
  
  
  GetEventAppointmentDetailVariablesBuilder getEventAppointmentDetail ({required String appointmentId, }) {
    return GetEventAppointmentDetailVariablesBuilder(dataConnect, appointmentId: appointmentId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'europe-southwest1',
    'samby',
    'samby-database-service',
  );

  SambyConnector({required this.dataConnect});
  static SambyConnector get instance {
    
    return SambyConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
