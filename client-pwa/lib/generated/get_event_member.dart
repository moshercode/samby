part of 'samby.dart';

class GetEventMemberVariablesBuilder {
  String eventId;
  String memberId;

  final FirebaseDataConnect _dataConnect;
  GetEventMemberVariablesBuilder(this._dataConnect, {required  this.eventId,required  this.memberId,});
  Deserializer<GetEventMemberData> dataDeserializer = (dynamic json)  => GetEventMemberData.fromJson(jsonDecode(json));
  Serializer<GetEventMemberVariables> varsSerializer = (GetEventMemberVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetEventMemberData, GetEventMemberVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetEventMemberData, GetEventMemberVariables> ref() {
    GetEventMemberVariables vars= GetEventMemberVariables(eventId: eventId,memberId: memberId,);
    return _dataConnect.query("GetEventMember", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetEventMemberEventMembers {
  final String id;
  final String status;
  final Timestamp? requestedAt;
  final Timestamp? resolvedAt;
  GetEventMemberEventMembers.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  status = nativeFromJson<String>(json['status']),
  requestedAt = json['requestedAt'] == null ? null : Timestamp.fromJson(json['requestedAt']),
  resolvedAt = json['resolvedAt'] == null ? null : Timestamp.fromJson(json['resolvedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventMemberEventMembers otherTyped = other as GetEventMemberEventMembers;
    return id == otherTyped.id && 
    status == otherTyped.status && 
    requestedAt == otherTyped.requestedAt && 
    resolvedAt == otherTyped.resolvedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, status.hashCode, requestedAt.hashCode, resolvedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['status'] = nativeToJson<String>(status);
    if (requestedAt != null) {
      json['requestedAt'] = requestedAt!.toJson();
    }
    if (resolvedAt != null) {
      json['resolvedAt'] = resolvedAt!.toJson();
    }
    return json;
  }

  GetEventMemberEventMembers({
    required this.id,
    required this.status,
    this.requestedAt,
    this.resolvedAt,
  });
}

@immutable
class GetEventMemberData {
  final List<GetEventMemberEventMembers> eventMembers;
  GetEventMemberData.fromJson(dynamic json):
  
  eventMembers = (json['eventMembers'] as List<dynamic>)
        .map((e) => GetEventMemberEventMembers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventMemberData otherTyped = other as GetEventMemberData;
    return eventMembers == otherTyped.eventMembers;
    
  }
  @override
  int get hashCode => eventMembers.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventMembers'] = eventMembers.map((e) => e.toJson()).toList();
    return json;
  }

  GetEventMemberData({
    required this.eventMembers,
  });
}

@immutable
class GetEventMemberVariables {
  final String eventId;
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetEventMemberVariables.fromJson(Map<String, dynamic> json):
  
  eventId = nativeFromJson<String>(json['eventId']),
  memberId = nativeFromJson<String>(json['memberId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventMemberVariables otherTyped = other as GetEventMemberVariables;
    return eventId == otherTyped.eventId && 
    memberId == otherTyped.memberId;
    
  }
  @override
  int get hashCode => Object.hashAll([eventId.hashCode, memberId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventId'] = nativeToJson<String>(eventId);
    json['memberId'] = nativeToJson<String>(memberId);
    return json;
  }

  GetEventMemberVariables({
    required this.eventId,
    required this.memberId,
  });
}

