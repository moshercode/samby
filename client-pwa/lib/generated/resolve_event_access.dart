part of 'samby.dart';

class ResolveEventAccessVariablesBuilder {
  String id;
  String status;
  String resolvedBy;
  Timestamp resolvedAt;

  final FirebaseDataConnect _dataConnect;
  ResolveEventAccessVariablesBuilder(this._dataConnect, {required  this.id,required  this.status,required  this.resolvedBy,required  this.resolvedAt,});
  Deserializer<ResolveEventAccessData> dataDeserializer = (dynamic json)  => ResolveEventAccessData.fromJson(jsonDecode(json));
  Serializer<ResolveEventAccessVariables> varsSerializer = (ResolveEventAccessVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ResolveEventAccessData, ResolveEventAccessVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ResolveEventAccessData, ResolveEventAccessVariables> ref() {
    ResolveEventAccessVariables vars= ResolveEventAccessVariables(id: id,status: status,resolvedBy: resolvedBy,resolvedAt: resolvedAt,);
    return _dataConnect.mutation("ResolveEventAccess", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ResolveEventAccessEventMemberUpdate {
  final String id;
  ResolveEventAccessEventMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResolveEventAccessEventMemberUpdate otherTyped = other as ResolveEventAccessEventMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  ResolveEventAccessEventMemberUpdate({
    required this.id,
  });
}

@immutable
class ResolveEventAccessData {
  final ResolveEventAccessEventMemberUpdate? eventMember_update;
  ResolveEventAccessData.fromJson(dynamic json):
  
  eventMember_update = json['eventMember_update'] == null ? null : ResolveEventAccessEventMemberUpdate.fromJson(json['eventMember_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResolveEventAccessData otherTyped = other as ResolveEventAccessData;
    return eventMember_update == otherTyped.eventMember_update;
    
  }
  @override
  int get hashCode => eventMember_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (eventMember_update != null) {
      json['eventMember_update'] = eventMember_update!.toJson();
    }
    return json;
  }

  ResolveEventAccessData({
    this.eventMember_update,
  });
}

@immutable
class ResolveEventAccessVariables {
  final String id;
  final String status;
  final String resolvedBy;
  final Timestamp resolvedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ResolveEventAccessVariables.fromJson(Map<String, dynamic> json):
  
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

    final ResolveEventAccessVariables otherTyped = other as ResolveEventAccessVariables;
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

  ResolveEventAccessVariables({
    required this.id,
    required this.status,
    required this.resolvedBy,
    required this.resolvedAt,
  });
}

