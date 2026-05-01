part of 'samby.dart';

class AddAssociationConditionVariablesBuilder {
  String associationId;
  String type;
  String content;
  int sortOrder;

  final FirebaseDataConnect _dataConnect;
  AddAssociationConditionVariablesBuilder(this._dataConnect, {required  this.associationId,required  this.type,required  this.content,required  this.sortOrder,});
  Deserializer<AddAssociationConditionData> dataDeserializer = (dynamic json)  => AddAssociationConditionData.fromJson(jsonDecode(json));
  Serializer<AddAssociationConditionVariables> varsSerializer = (AddAssociationConditionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddAssociationConditionData, AddAssociationConditionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddAssociationConditionData, AddAssociationConditionVariables> ref() {
    AddAssociationConditionVariables vars= AddAssociationConditionVariables(associationId: associationId,type: type,content: content,sortOrder: sortOrder,);
    return _dataConnect.mutation("AddAssociationCondition", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AddAssociationConditionAssociationConditionInsert {
  final String id;
  AddAssociationConditionAssociationConditionInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddAssociationConditionAssociationConditionInsert otherTyped = other as AddAssociationConditionAssociationConditionInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddAssociationConditionAssociationConditionInsert({
    required this.id,
  });
}

@immutable
class AddAssociationConditionData {
  final AddAssociationConditionAssociationConditionInsert associationCondition_insert;
  AddAssociationConditionData.fromJson(dynamic json):
  
  associationCondition_insert = AddAssociationConditionAssociationConditionInsert.fromJson(json['associationCondition_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddAssociationConditionData otherTyped = other as AddAssociationConditionData;
    return associationCondition_insert == otherTyped.associationCondition_insert;
    
  }
  @override
  int get hashCode => associationCondition_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationCondition_insert'] = associationCondition_insert.toJson();
    return json;
  }

  AddAssociationConditionData({
    required this.associationCondition_insert,
  });
}

@immutable
class AddAssociationConditionVariables {
  final String associationId;
  final String type;
  final String content;
  final int sortOrder;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddAssociationConditionVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']),
  type = nativeFromJson<String>(json['type']),
  content = nativeFromJson<String>(json['content']),
  sortOrder = nativeFromJson<int>(json['sortOrder']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddAssociationConditionVariables otherTyped = other as AddAssociationConditionVariables;
    return associationId == otherTyped.associationId && 
    type == otherTyped.type && 
    content == otherTyped.content && 
    sortOrder == otherTyped.sortOrder;
    
  }
  @override
  int get hashCode => Object.hashAll([associationId.hashCode, type.hashCode, content.hashCode, sortOrder.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    json['type'] = nativeToJson<String>(type);
    json['content'] = nativeToJson<String>(content);
    json['sortOrder'] = nativeToJson<int>(sortOrder);
    return json;
  }

  AddAssociationConditionVariables({
    required this.associationId,
    required this.type,
    required this.content,
    required this.sortOrder,
  });
}

