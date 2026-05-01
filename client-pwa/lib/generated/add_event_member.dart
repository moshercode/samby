part of 'samby.dart';

class AddEventMemberVariablesBuilder {
  String eventId;
  String memberId;

  final FirebaseDataConnect _dataConnect;
  AddEventMemberVariablesBuilder(this._dataConnect, {required  this.eventId,required  this.memberId,});
  Deserializer<AddEventMemberData> dataDeserializer = (dynamic json)  => AddEventMemberData.fromJson(jsonDecode(json));
  Serializer<AddEventMemberVariables> varsSerializer = (AddEventMemberVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddEventMemberData, AddEventMemberVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddEventMemberData, AddEventMemberVariables> ref() {
    AddEventMemberVariables vars= AddEventMemberVariables(eventId: eventId,memberId: memberId,);
    return _dataConnect.mutation("AddEventMember", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AddEventMemberEventMemberInsert {
  final String id;
  AddEventMemberEventMemberInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddEventMemberEventMemberInsert otherTyped = other as AddEventMemberEventMemberInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddEventMemberEventMemberInsert({
    required this.id,
  });
}

@immutable
class AddEventMemberData {
  final AddEventMemberEventMemberInsert eventMember_insert;
  AddEventMemberData.fromJson(dynamic json):
  
  eventMember_insert = AddEventMemberEventMemberInsert.fromJson(json['eventMember_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddEventMemberData otherTyped = other as AddEventMemberData;
    return eventMember_insert == otherTyped.eventMember_insert;
    
  }
  @override
  int get hashCode => eventMember_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventMember_insert'] = eventMember_insert.toJson();
    return json;
  }

  AddEventMemberData({
    required this.eventMember_insert,
  });
}

@immutable
class AddEventMemberVariables {
  final String eventId;
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddEventMemberVariables.fromJson(Map<String, dynamic> json):
  
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

    final AddEventMemberVariables otherTyped = other as AddEventMemberVariables;
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

  AddEventMemberVariables({
    required this.eventId,
    required this.memberId,
  });
}

