part of 'samby.dart';

class RequestEventAccessVariablesBuilder {
  String eventId;
  String memberId;

  final FirebaseDataConnect _dataConnect;
  RequestEventAccessVariablesBuilder(this._dataConnect, {required  this.eventId,required  this.memberId,});
  Deserializer<RequestEventAccessData> dataDeserializer = (dynamic json)  => RequestEventAccessData.fromJson(jsonDecode(json));
  Serializer<RequestEventAccessVariables> varsSerializer = (RequestEventAccessVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RequestEventAccessData, RequestEventAccessVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RequestEventAccessData, RequestEventAccessVariables> ref() {
    RequestEventAccessVariables vars= RequestEventAccessVariables(eventId: eventId,memberId: memberId,);
    return _dataConnect.mutation("RequestEventAccess", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RequestEventAccessEventMemberInsert {
  final String id;
  RequestEventAccessEventMemberInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RequestEventAccessEventMemberInsert otherTyped = other as RequestEventAccessEventMemberInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  RequestEventAccessEventMemberInsert({
    required this.id,
  });
}

@immutable
class RequestEventAccessData {
  final RequestEventAccessEventMemberInsert eventMember_insert;
  RequestEventAccessData.fromJson(dynamic json):
  
  eventMember_insert = RequestEventAccessEventMemberInsert.fromJson(json['eventMember_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RequestEventAccessData otherTyped = other as RequestEventAccessData;
    return eventMember_insert == otherTyped.eventMember_insert;
    
  }
  @override
  int get hashCode => eventMember_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventMember_insert'] = eventMember_insert.toJson();
    return json;
  }

  RequestEventAccessData({
    required this.eventMember_insert,
  });
}

@immutable
class RequestEventAccessVariables {
  final String eventId;
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RequestEventAccessVariables.fromJson(Map<String, dynamic> json):
  
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

    final RequestEventAccessVariables otherTyped = other as RequestEventAccessVariables;
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

  RequestEventAccessVariables({
    required this.eventId,
    required this.memberId,
  });
}

