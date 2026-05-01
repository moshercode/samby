part of 'samby.dart';

class RemoveEventMemberVariablesBuilder {
  String eventId;
  String memberId;

  final FirebaseDataConnect _dataConnect;
  RemoveEventMemberVariablesBuilder(this._dataConnect, {required  this.eventId,required  this.memberId,});
  Deserializer<RemoveEventMemberData> dataDeserializer = (dynamic json)  => RemoveEventMemberData.fromJson(jsonDecode(json));
  Serializer<RemoveEventMemberVariables> varsSerializer = (RemoveEventMemberVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RemoveEventMemberData, RemoveEventMemberVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RemoveEventMemberData, RemoveEventMemberVariables> ref() {
    RemoveEventMemberVariables vars= RemoveEventMemberVariables(eventId: eventId,memberId: memberId,);
    return _dataConnect.mutation("RemoveEventMember", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RemoveEventMemberData {
  final int eventMember_deleteMany;
  RemoveEventMemberData.fromJson(dynamic json):
  
  eventMember_deleteMany = nativeFromJson<int>(json['eventMember_deleteMany']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RemoveEventMemberData otherTyped = other as RemoveEventMemberData;
    return eventMember_deleteMany == otherTyped.eventMember_deleteMany;
    
  }
  @override
  int get hashCode => eventMember_deleteMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventMember_deleteMany'] = nativeToJson<int>(eventMember_deleteMany);
    return json;
  }

  RemoveEventMemberData({
    required this.eventMember_deleteMany,
  });
}

@immutable
class RemoveEventMemberVariables {
  final String eventId;
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RemoveEventMemberVariables.fromJson(Map<String, dynamic> json):
  
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

    final RemoveEventMemberVariables otherTyped = other as RemoveEventMemberVariables;
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

  RemoveEventMemberVariables({
    required this.eventId,
    required this.memberId,
  });
}

