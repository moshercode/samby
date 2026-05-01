part of 'samby.dart';

class UpdateMemberFcmTokenVariablesBuilder {
  String id;
  String token;
  Timestamp updatedAt;

  final FirebaseDataConnect _dataConnect;
  UpdateMemberFcmTokenVariablesBuilder(this._dataConnect, {required  this.id,required  this.token,required  this.updatedAt,});
  Deserializer<UpdateMemberFcmTokenData> dataDeserializer = (dynamic json)  => UpdateMemberFcmTokenData.fromJson(jsonDecode(json));
  Serializer<UpdateMemberFcmTokenVariables> varsSerializer = (UpdateMemberFcmTokenVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMemberFcmTokenData, UpdateMemberFcmTokenVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMemberFcmTokenData, UpdateMemberFcmTokenVariables> ref() {
    UpdateMemberFcmTokenVariables vars= UpdateMemberFcmTokenVariables(id: id,token: token,updatedAt: updatedAt,);
    return _dataConnect.mutation("UpdateMemberFcmToken", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateMemberFcmTokenMemberUpdate {
  final String id;
  UpdateMemberFcmTokenMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberFcmTokenMemberUpdate otherTyped = other as UpdateMemberFcmTokenMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMemberFcmTokenMemberUpdate({
    required this.id,
  });
}

@immutable
class UpdateMemberFcmTokenData {
  final UpdateMemberFcmTokenMemberUpdate? member_update;
  UpdateMemberFcmTokenData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : UpdateMemberFcmTokenMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberFcmTokenData otherTyped = other as UpdateMemberFcmTokenData;
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

  UpdateMemberFcmTokenData({
    this.member_update,
  });
}

@immutable
class UpdateMemberFcmTokenVariables {
  final String id;
  final String token;
  final Timestamp updatedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMemberFcmTokenVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  token = nativeFromJson<String>(json['token']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberFcmTokenVariables otherTyped = other as UpdateMemberFcmTokenVariables;
    return id == otherTyped.id && 
    token == otherTyped.token && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, token.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['token'] = nativeToJson<String>(token);
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  UpdateMemberFcmTokenVariables({
    required this.id,
    required this.token,
    required this.updatedAt,
  });
}

