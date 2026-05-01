part of 'samby.dart';

class UpdateMemberStatusVariablesBuilder {
  String id;
  String status;
  String resolvedBy;
  Timestamp resolvedAt;

  final FirebaseDataConnect _dataConnect;
  UpdateMemberStatusVariablesBuilder(this._dataConnect, {required  this.id,required  this.status,required  this.resolvedBy,required  this.resolvedAt,});
  Deserializer<UpdateMemberStatusData> dataDeserializer = (dynamic json)  => UpdateMemberStatusData.fromJson(jsonDecode(json));
  Serializer<UpdateMemberStatusVariables> varsSerializer = (UpdateMemberStatusVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMemberStatusData, UpdateMemberStatusVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMemberStatusData, UpdateMemberStatusVariables> ref() {
    UpdateMemberStatusVariables vars= UpdateMemberStatusVariables(id: id,status: status,resolvedBy: resolvedBy,resolvedAt: resolvedAt,);
    return _dataConnect.mutation("UpdateMemberStatus", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateMemberStatusMemberUpdate {
  final String id;
  UpdateMemberStatusMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberStatusMemberUpdate otherTyped = other as UpdateMemberStatusMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMemberStatusMemberUpdate({
    required this.id,
  });
}

@immutable
class UpdateMemberStatusData {
  final UpdateMemberStatusMemberUpdate? member_update;
  UpdateMemberStatusData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : UpdateMemberStatusMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberStatusData otherTyped = other as UpdateMemberStatusData;
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

  UpdateMemberStatusData({
    this.member_update,
  });
}

@immutable
class UpdateMemberStatusVariables {
  final String id;
  final String status;
  final String resolvedBy;
  final Timestamp resolvedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMemberStatusVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  status = nativeFromJson<String>(json['status']),
  resolvedBy = nativeFromJson<String>(json['resolvedBy']),
  resolvedAt = Timestamp.fromJson(json['resolvedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberStatusVariables otherTyped = other as UpdateMemberStatusVariables;
    return id == otherTyped.id && 
    status == otherTyped.status && 
    resolvedBy == otherTyped.resolvedBy && 
    resolvedAt == otherTyped.resolvedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, status.hashCode, resolvedBy.hashCode, resolvedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['status'] = nativeToJson<String>(status);
    json['resolvedBy'] = nativeToJson<String>(resolvedBy);
    json['resolvedAt'] = resolvedAt.toJson();
    return json;
  }

  UpdateMemberStatusVariables({
    required this.id,
    required this.status,
    required this.resolvedBy,
    required this.resolvedAt,
  });
}

