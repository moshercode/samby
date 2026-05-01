part of 'samby.dart';

class UpdateEventStatusVariablesBuilder {
  String id;
  EventStatus status;
  Timestamp updatedAt;

  final FirebaseDataConnect _dataConnect;
  UpdateEventStatusVariablesBuilder(this._dataConnect, {required  this.id,required  this.status,required  this.updatedAt,});
  Deserializer<UpdateEventStatusData> dataDeserializer = (dynamic json)  => UpdateEventStatusData.fromJson(jsonDecode(json));
  Serializer<UpdateEventStatusVariables> varsSerializer = (UpdateEventStatusVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateEventStatusData, UpdateEventStatusVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateEventStatusData, UpdateEventStatusVariables> ref() {
    UpdateEventStatusVariables vars= UpdateEventStatusVariables(id: id,status: status,updatedAt: updatedAt,);
    return _dataConnect.mutation("UpdateEventStatus", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateEventStatusEventUpdate {
  final String id;
  UpdateEventStatusEventUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateEventStatusEventUpdate otherTyped = other as UpdateEventStatusEventUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateEventStatusEventUpdate({
    required this.id,
  });
}

@immutable
class UpdateEventStatusData {
  final UpdateEventStatusEventUpdate? event_update;
  UpdateEventStatusData.fromJson(dynamic json):
  
  event_update = json['event_update'] == null ? null : UpdateEventStatusEventUpdate.fromJson(json['event_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateEventStatusData otherTyped = other as UpdateEventStatusData;
    return event_update == otherTyped.event_update;
    
  }
  @override
  int get hashCode => event_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (event_update != null) {
      json['event_update'] = event_update!.toJson();
    }
    return json;
  }

  UpdateEventStatusData({
    this.event_update,
  });
}

@immutable
class UpdateEventStatusVariables {
  final String id;
  final EventStatus status;
  final Timestamp updatedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateEventStatusVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  status = EventStatus.values.byName(json['status']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateEventStatusVariables otherTyped = other as UpdateEventStatusVariables;
    return id == otherTyped.id && 
    status == otherTyped.status && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, status.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['status'] = 
    status.name
    ;
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  UpdateEventStatusVariables({
    required this.id,
    required this.status,
    required this.updatedAt,
  });
}

