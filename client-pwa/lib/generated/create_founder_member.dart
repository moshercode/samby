part of 'samby.dart';

class CreateFounderMemberVariablesBuilder {
  String associationId;
  String name;
  String email;
  Timestamp conditionsAcceptedAt;

  final FirebaseDataConnect _dataConnect;
  CreateFounderMemberVariablesBuilder(this._dataConnect, {required  this.associationId,required  this.name,required  this.email,required  this.conditionsAcceptedAt,});
  Deserializer<CreateFounderMemberData> dataDeserializer = (dynamic json)  => CreateFounderMemberData.fromJson(jsonDecode(json));
  Serializer<CreateFounderMemberVariables> varsSerializer = (CreateFounderMemberVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateFounderMemberData, CreateFounderMemberVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateFounderMemberData, CreateFounderMemberVariables> ref() {
    CreateFounderMemberVariables vars= CreateFounderMemberVariables(associationId: associationId,name: name,email: email,conditionsAcceptedAt: conditionsAcceptedAt,);
    return _dataConnect.mutation("CreateFounderMember", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateFounderMemberMemberInsert {
  final String id;
  CreateFounderMemberMemberInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateFounderMemberMemberInsert otherTyped = other as CreateFounderMemberMemberInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateFounderMemberMemberInsert({
    required this.id,
  });
}

@immutable
class CreateFounderMemberData {
  final CreateFounderMemberMemberInsert member_insert;
  CreateFounderMemberData.fromJson(dynamic json):
  
  member_insert = CreateFounderMemberMemberInsert.fromJson(json['member_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateFounderMemberData otherTyped = other as CreateFounderMemberData;
    return member_insert == otherTyped.member_insert;
    
  }
  @override
  int get hashCode => member_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['member_insert'] = member_insert.toJson();
    return json;
  }

  CreateFounderMemberData({
    required this.member_insert,
  });
}

@immutable
class CreateFounderMemberVariables {
  final String associationId;
  final String name;
  final String email;
  final Timestamp conditionsAcceptedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateFounderMemberVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']),
  name = nativeFromJson<String>(json['name']),
  email = nativeFromJson<String>(json['email']),
  conditionsAcceptedAt = Timestamp.fromJson(json['conditionsAcceptedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateFounderMemberVariables otherTyped = other as CreateFounderMemberVariables;
    return associationId == otherTyped.associationId && 
    name == otherTyped.name && 
    email == otherTyped.email && 
    conditionsAcceptedAt == otherTyped.conditionsAcceptedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([associationId.hashCode, name.hashCode, email.hashCode, conditionsAcceptedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['conditionsAcceptedAt'] = conditionsAcceptedAt.toJson();
    return json;
  }

  CreateFounderMemberVariables({
    required this.associationId,
    required this.name,
    required this.email,
    required this.conditionsAcceptedAt,
  });
}

