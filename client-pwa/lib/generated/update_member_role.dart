part of 'samby.dart';

class UpdateMemberRoleVariablesBuilder {
  String id;
  MemberRole role;

  final FirebaseDataConnect _dataConnect;
  UpdateMemberRoleVariablesBuilder(this._dataConnect, {required  this.id,required  this.role,});
  Deserializer<UpdateMemberRoleData> dataDeserializer = (dynamic json)  => UpdateMemberRoleData.fromJson(jsonDecode(json));
  Serializer<UpdateMemberRoleVariables> varsSerializer = (UpdateMemberRoleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMemberRoleData, UpdateMemberRoleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMemberRoleData, UpdateMemberRoleVariables> ref() {
    UpdateMemberRoleVariables vars= UpdateMemberRoleVariables(id: id,role: role,);
    return _dataConnect.mutation("UpdateMemberRole", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateMemberRoleMemberUpdate {
  final String id;
  UpdateMemberRoleMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberRoleMemberUpdate otherTyped = other as UpdateMemberRoleMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMemberRoleMemberUpdate({
    required this.id,
  });
}

@immutable
class UpdateMemberRoleData {
  final UpdateMemberRoleMemberUpdate? member_update;
  UpdateMemberRoleData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : UpdateMemberRoleMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberRoleData otherTyped = other as UpdateMemberRoleData;
    return member_update == otherTyped.member_update;
    
  }
  @override
  int get hashCode => member_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (member_update != null) {
      json['member_update'] = member_update!.toJson();
    }
    return json;
  }

  UpdateMemberRoleData({
    this.member_update,
  });
}

@immutable
class UpdateMemberRoleVariables {
  final String id;
  final MemberRole role;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMemberRoleVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  role = MemberRole.values.byName(json['role']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberRoleVariables otherTyped = other as UpdateMemberRoleVariables;
    return id == otherTyped.id && 
    role == otherTyped.role;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, role.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['role'] = 
    role.name
    ;
    return json;
  }

  UpdateMemberRoleVariables({
    required this.id,
    required this.role,
  });
}

