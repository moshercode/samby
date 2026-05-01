part of 'samby.dart';

class AddBandConditionVariablesBuilder {
  String bandId;
  String type;
  String content;
  int sortOrder;

  final FirebaseDataConnect _dataConnect;
  AddBandConditionVariablesBuilder(this._dataConnect, {required  this.bandId,required  this.type,required  this.content,required  this.sortOrder,});
  Deserializer<AddBandConditionData> dataDeserializer = (dynamic json)  => AddBandConditionData.fromJson(jsonDecode(json));
  Serializer<AddBandConditionVariables> varsSerializer = (AddBandConditionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddBandConditionData, AddBandConditionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddBandConditionData, AddBandConditionVariables> ref() {
    AddBandConditionVariables vars= AddBandConditionVariables(bandId: bandId,type: type,content: content,sortOrder: sortOrder,);
    return _dataConnect.mutation("AddBandCondition", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AddBandConditionBandConditionInsert {
  final String id;
  AddBandConditionBandConditionInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddBandConditionBandConditionInsert otherTyped = other as AddBandConditionBandConditionInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddBandConditionBandConditionInsert({
    required this.id,
  });
}

@immutable
class AddBandConditionData {
  final AddBandConditionBandConditionInsert bandCondition_insert;
  AddBandConditionData.fromJson(dynamic json):
  
  bandCondition_insert = AddBandConditionBandConditionInsert.fromJson(json['bandCondition_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddBandConditionData otherTyped = other as AddBandConditionData;
    return bandCondition_insert == otherTyped.bandCondition_insert;
    
  }
  @override
  int get hashCode => bandCondition_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandCondition_insert'] = bandCondition_insert.toJson();
    return json;
  }

  AddBandConditionData({
    required this.bandCondition_insert,
  });
}

@immutable
class AddBandConditionVariables {
  final String bandId;
  final String type;
  final String content;
  final int sortOrder;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddBandConditionVariables.fromJson(Map<String, dynamic> json):
  
  bandId = nativeFromJson<String>(json['bandId']),
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

    final AddBandConditionVariables otherTyped = other as AddBandConditionVariables;
    return bandId == otherTyped.bandId && 
    type == otherTyped.type && 
    content == otherTyped.content && 
    sortOrder == otherTyped.sortOrder;
    
  }
  @override
  int get hashCode => Object.hashAll([bandId.hashCode, type.hashCode, content.hashCode, sortOrder.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandId'] = nativeToJson<String>(bandId);
    json['type'] = nativeToJson<String>(type);
    json['content'] = nativeToJson<String>(content);
    json['sortOrder'] = nativeToJson<int>(sortOrder);
    return json;
  }

  AddBandConditionVariables({
    required this.bandId,
    required this.type,
    required this.content,
    required this.sortOrder,
  });
}

