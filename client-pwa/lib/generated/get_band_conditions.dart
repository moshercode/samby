part of 'samby.dart';

class GetBandConditionsVariablesBuilder {
  String bandId;

  final FirebaseDataConnect _dataConnect;
  GetBandConditionsVariablesBuilder(this._dataConnect, {required  this.bandId,});
  Deserializer<GetBandConditionsData> dataDeserializer = (dynamic json)  => GetBandConditionsData.fromJson(jsonDecode(json));
  Serializer<GetBandConditionsVariables> varsSerializer = (GetBandConditionsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetBandConditionsData, GetBandConditionsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetBandConditionsData, GetBandConditionsVariables> ref() {
    GetBandConditionsVariables vars= GetBandConditionsVariables(bandId: bandId,);
    return _dataConnect.query("GetBandConditions", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetBandConditionsBandConditions {
  final String id;
  final String type;
  final String content;
  final int sortOrder;
  GetBandConditionsBandConditions.fromJson(dynamic json):
  
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

    final GetBandConditionsBandConditions otherTyped = other as GetBandConditionsBandConditions;
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

  GetBandConditionsBandConditions({
    required this.id,
    required this.type,
    required this.content,
    required this.sortOrder,
  });
}

@immutable
class GetBandConditionsData {
  final List<GetBandConditionsBandConditions> bandConditions;
  GetBandConditionsData.fromJson(dynamic json):
  
  bandConditions = (json['bandConditions'] as List<dynamic>)
        .map((e) => GetBandConditionsBandConditions.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandConditionsData otherTyped = other as GetBandConditionsData;
    return bandConditions == otherTyped.bandConditions;
    
  }
  @override
  int get hashCode => bandConditions.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandConditions'] = bandConditions.map((e) => e.toJson()).toList();
    return json;
  }

  GetBandConditionsData({
    required this.bandConditions,
  });
}

@immutable
class GetBandConditionsVariables {
  final String bandId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetBandConditionsVariables.fromJson(Map<String, dynamic> json):
  
  bandId = nativeFromJson<String>(json['bandId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandConditionsVariables otherTyped = other as GetBandConditionsVariables;
    return bandId == otherTyped.bandId;
    
  }
  @override
  int get hashCode => bandId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandId'] = nativeToJson<String>(bandId);
    return json;
  }

  GetBandConditionsVariables({
    required this.bandId,
  });
}

