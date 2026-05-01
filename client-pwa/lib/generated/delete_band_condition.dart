part of 'samby.dart';

class DeleteBandConditionVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteBandConditionVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteBandConditionData> dataDeserializer = (dynamic json)  => DeleteBandConditionData.fromJson(jsonDecode(json));
  Serializer<DeleteBandConditionVariables> varsSerializer = (DeleteBandConditionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteBandConditionData, DeleteBandConditionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteBandConditionData, DeleteBandConditionVariables> ref() {
    DeleteBandConditionVariables vars= DeleteBandConditionVariables(id: id,);
    return _dataConnect.mutation("DeleteBandCondition", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeleteBandConditionBandConditionDelete {
  final String id;
  DeleteBandConditionBandConditionDelete.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteBandConditionBandConditionDelete otherTyped = other as DeleteBandConditionBandConditionDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteBandConditionBandConditionDelete({
    required this.id,
  });
}

@immutable
class DeleteBandConditionData {
  final DeleteBandConditionBandConditionDelete? bandCondition_delete;
  DeleteBandConditionData.fromJson(dynamic json):
  
  bandCondition_delete = json['bandCondition_delete'] == null ? null : DeleteBandConditionBandConditionDelete.fromJson(json['bandCondition_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteBandConditionData otherTyped = other as DeleteBandConditionData;
    return bandCondition_delete == otherTyped.bandCondition_delete;
    
  }
  @override
  int get hashCode => bandCondition_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (bandCondition_delete != null) {
      json['bandCondition_delete'] = bandCondition_delete!.toJson();
    }
    return json;
  }

  DeleteBandConditionData({
    this.bandCondition_delete,
  });
}

@immutable
class DeleteBandConditionVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteBandConditionVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteBandConditionVariables otherTyped = other as DeleteBandConditionVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteBandConditionVariables({
    required this.id,
  });
}

