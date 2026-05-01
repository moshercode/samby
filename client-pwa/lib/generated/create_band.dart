part of 'samby.dart';

class CreateBandVariablesBuilder {
  String name;
  String shortName;
  String subdomain;
  String primaryColor;
  String secondaryColor;
  String founderEmail;

  final FirebaseDataConnect _dataConnect;
  CreateBandVariablesBuilder(this._dataConnect, {required  this.name,required  this.shortName,required  this.subdomain,required  this.primaryColor,required  this.secondaryColor,required  this.founderEmail,});
  Deserializer<CreateBandData> dataDeserializer = (dynamic json)  => CreateBandData.fromJson(jsonDecode(json));
  Serializer<CreateBandVariables> varsSerializer = (CreateBandVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateBandData, CreateBandVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateBandData, CreateBandVariables> ref() {
    CreateBandVariables vars= CreateBandVariables(name: name,shortName: shortName,subdomain: subdomain,primaryColor: primaryColor,secondaryColor: secondaryColor,founderEmail: founderEmail,);
    return _dataConnect.mutation("CreateBand", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateBandBandInsert {
  final String id;
  CreateBandBandInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBandBandInsert otherTyped = other as CreateBandBandInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateBandBandInsert({
    required this.id,
  });
}

@immutable
class CreateBandData {
  final CreateBandBandInsert band_insert;
  CreateBandData.fromJson(dynamic json):
  
  band_insert = CreateBandBandInsert.fromJson(json['band_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBandData otherTyped = other as CreateBandData;
    return band_insert == otherTyped.band_insert;
    
  }
  @override
  int get hashCode => band_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['band_insert'] = band_insert.toJson();
    return json;
  }

  CreateBandData({
    required this.band_insert,
  });
}

@immutable
class CreateBandVariables {
  final String name;
  final String shortName;
  final String subdomain;
  final String primaryColor;
  final String secondaryColor;
  final String founderEmail;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateBandVariables.fromJson(Map<String, dynamic> json):
  
  name = nativeFromJson<String>(json['name']),
  shortName = nativeFromJson<String>(json['shortName']),
  subdomain = nativeFromJson<String>(json['subdomain']),
  primaryColor = nativeFromJson<String>(json['primaryColor']),
  secondaryColor = nativeFromJson<String>(json['secondaryColor']),
  founderEmail = nativeFromJson<String>(json['founderEmail']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBandVariables otherTyped = other as CreateBandVariables;
    return name == otherTyped.name && 
    shortName == otherTyped.shortName && 
    subdomain == otherTyped.subdomain && 
    primaryColor == otherTyped.primaryColor && 
    secondaryColor == otherTyped.secondaryColor && 
    founderEmail == otherTyped.founderEmail;
    
  }
  @override
  int get hashCode => Object.hashAll([name.hashCode, shortName.hashCode, subdomain.hashCode, primaryColor.hashCode, secondaryColor.hashCode, founderEmail.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['shortName'] = nativeToJson<String>(shortName);
    json['subdomain'] = nativeToJson<String>(subdomain);
    json['primaryColor'] = nativeToJson<String>(primaryColor);
    json['secondaryColor'] = nativeToJson<String>(secondaryColor);
    json['founderEmail'] = nativeToJson<String>(founderEmail);
    return json;
  }

  CreateBandVariables({
    required this.name,
    required this.shortName,
    required this.subdomain,
    required this.primaryColor,
    required this.secondaryColor,
    required this.founderEmail,
  });
}

