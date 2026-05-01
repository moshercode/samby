part of 'samby.dart';

class UpdateMemberBlockVariablesBuilder {
  String id;
  bool isBlocked;

  final FirebaseDataConnect _dataConnect;
  UpdateMemberBlockVariablesBuilder(this._dataConnect, {required  this.id,required  this.isBlocked,});
  Deserializer<UpdateMemberBlockData> dataDeserializer = (dynamic json)  => UpdateMemberBlockData.fromJson(jsonDecode(json));
  Serializer<UpdateMemberBlockVariables> varsSerializer = (UpdateMemberBlockVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMemberBlockData, UpdateMemberBlockVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMemberBlockData, UpdateMemberBlockVariables> ref() {
    UpdateMemberBlockVariables vars= UpdateMemberBlockVariables(id: id,isBlocked: isBlocked,);
    return _dataConnect.mutation("UpdateMemberBlock", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateMemberBlockMemberUpdate {
  final String id;
  UpdateMemberBlockMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberBlockMemberUpdate otherTyped = other as UpdateMemberBlockMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMemberBlockMemberUpdate({
    required this.id,
  });
}

@immutable
class UpdateMemberBlockData {
  final UpdateMemberBlockMemberUpdate? member_update;
  UpdateMemberBlockData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : UpdateMemberBlockMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberBlockData otherTyped = other as UpdateMemberBlockData;
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

  UpdateMemberBlockData({
    this.member_update,
  });
}

@immutable
class UpdateMemberBlockVariables {
  final String id;
  final bool isBlocked;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMemberBlockVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  isBlocked = nativeFromJson<bool>(json['isBlocked']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberBlockVariables otherTyped = other as UpdateMemberBlockVariables;
    return id == otherTyped.id && 
    isBlocked == otherTyped.isBlocked;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, isBlocked.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['isBlocked'] = nativeToJson<bool>(isBlocked);
    return json;
  }

  UpdateMemberBlockVariables({
    required this.id,
    required this.isBlocked,
  });
}

