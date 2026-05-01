part of 'samby.dart';

class DeleteAssociationConditionVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteAssociationConditionVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteAssociationConditionData> dataDeserializer = (dynamic json)  => DeleteAssociationConditionData.fromJson(jsonDecode(json));
  Serializer<DeleteAssociationConditionVariables> varsSerializer = (DeleteAssociationConditionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteAssociationConditionData, DeleteAssociationConditionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteAssociationConditionData, DeleteAssociationConditionVariables> ref() {
    DeleteAssociationConditionVariables vars= DeleteAssociationConditionVariables(id: id,);
    return _dataConnect.mutation("DeleteAssociationCondition", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeleteAssociationConditionAssociationConditionDelete {
  final String id;
  DeleteAssociationConditionAssociationConditionDelete.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteAssociationConditionAssociationConditionDelete otherTyped = other as DeleteAssociationConditionAssociationConditionDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteAssociationConditionAssociationConditionDelete({
    required this.id,
  });
}

@immutable
class DeleteAssociationConditionData {
  final DeleteAssociationConditionAssociationConditionDelete? associationCondition_delete;
  DeleteAssociationConditionData.fromJson(dynamic json):
  
  associationCondition_delete = json['associationCondition_delete'] == null ? null : DeleteAssociationConditionAssociationConditionDelete.fromJson(json['associationCondition_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteAssociationConditionData otherTyped = other as DeleteAssociationConditionData;
    return associationCondition_delete == otherTyped.associationCondition_delete;
    
  }
  @override
  int get hashCode => associationCondition_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (associationCondition_delete != null) {
      json['associationCondition_delete'] = associationCondition_delete!.toJson();
    }
    return json;
  }

  DeleteAssociationConditionData({
    this.associationCondition_delete,
  });
}

@immutable
class DeleteAssociationConditionVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteAssociationConditionVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteAssociationConditionVariables otherTyped = other as DeleteAssociationConditionVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteAssociationConditionVariables({
    required this.id,
  });
}

