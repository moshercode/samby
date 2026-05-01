part of 'samby.dart';

class GetAssociationConditionsVariablesBuilder {
  String associationId;

  final FirebaseDataConnect _dataConnect;
  GetAssociationConditionsVariablesBuilder(this._dataConnect, {required  this.associationId,});
  Deserializer<GetAssociationConditionsData> dataDeserializer = (dynamic json)  => GetAssociationConditionsData.fromJson(jsonDecode(json));
  Serializer<GetAssociationConditionsVariables> varsSerializer = (GetAssociationConditionsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAssociationConditionsData, GetAssociationConditionsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetAssociationConditionsData, GetAssociationConditionsVariables> ref() {
    GetAssociationConditionsVariables vars= GetAssociationConditionsVariables(associationId: associationId,);
    return _dataConnect.query("GetAssociationConditions", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetAssociationConditionsAssociationConditions {
  final String id;
  final String type;
  final String content;
  final int sortOrder;
  GetAssociationConditionsAssociationConditions.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
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

    final GetAssociationConditionsAssociationConditions otherTyped = other as GetAssociationConditionsAssociationConditions;
    return id == otherTyped.id && 
    type == otherTyped.type && 
    content == otherTyped.content && 
    sortOrder == otherTyped.sortOrder;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, type.hashCode, content.hashCode, sortOrder.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['type'] = nativeToJson<String>(type);
    json['content'] = nativeToJson<String>(content);
    json['sortOrder'] = nativeToJson<int>(sortOrder);
    return json;
  }

  GetAssociationConditionsAssociationConditions({
    required this.id,
    required this.type,
    required this.content,
    required this.sortOrder,
  });
}

@immutable
class GetAssociationConditionsData {
  final List<GetAssociationConditionsAssociationConditions> associationConditions;
  GetAssociationConditionsData.fromJson(dynamic json):
  
  associationConditions = (json['associationConditions'] as List<dynamic>)
        .map((e) => GetAssociationConditionsAssociationConditions.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationConditionsData otherTyped = other as GetAssociationConditionsData;
    return associationConditions == otherTyped.associationConditions;
    
  }
  @override
  int get hashCode => associationConditions.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationConditions'] = associationConditions.map((e) => e.toJson()).toList();
    return json;
  }

  GetAssociationConditionsData({
    required this.associationConditions,
  });
}

@immutable
class GetAssociationConditionsVariables {
  final String associationId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetAssociationConditionsVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationConditionsVariables otherTyped = other as GetAssociationConditionsVariables;
    return associationId == otherTyped.associationId;
    
  }
  @override
  int get hashCode => associationId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    return json;
  }

  GetAssociationConditionsVariables({
    required this.associationId,
  });
}

