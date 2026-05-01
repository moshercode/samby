part of 'samby.dart';

class CreateAssociationVariablesBuilder {
  String name;
  String shortName;
  String subdomain;
  String primaryColor;
  String secondaryColor;
  String founderEmail;

  final FirebaseDataConnect _dataConnect;
  CreateAssociationVariablesBuilder(this._dataConnect, {required  this.name,required  this.shortName,required  this.subdomain,required  this.primaryColor,required  this.secondaryColor,required  this.founderEmail,});
  Deserializer<CreateAssociationData> dataDeserializer = (dynamic json)  => CreateAssociationData.fromJson(jsonDecode(json));
  Serializer<CreateAssociationVariables> varsSerializer = (CreateAssociationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateAssociationData, CreateAssociationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateAssociationData, CreateAssociationVariables> ref() {
    CreateAssociationVariables vars= CreateAssociationVariables(name: name,shortName: shortName,subdomain: subdomain,primaryColor: primaryColor,secondaryColor: secondaryColor,founderEmail: founderEmail,);
    return _dataConnect.mutation("CreateAssociation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateAssociationAssociationInsert {
  final String id;
  CreateAssociationAssociationInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateAssociationAssociationInsert otherTyped = other as CreateAssociationAssociationInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateAssociationAssociationInsert({
    required this.id,
  });
}

@immutable
class CreateAssociationData {
  final CreateAssociationAssociationInsert association_insert;
  CreateAssociationData.fromJson(dynamic json):
  
  association_insert = CreateAssociationAssociationInsert.fromJson(json['association_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateAssociationData otherTyped = other as CreateAssociationData;
    return association_insert == otherTyped.association_insert;
    
  }
  @override
  int get hashCode => association_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['association_insert'] = association_insert.toJson();
    return json;
  }

  CreateAssociationData({
    required this.association_insert,
  });
}

@immutable
class CreateAssociationVariables {
  final String name;
  final String shortName;
  final String subdomain;
  final String primaryColor;
  final String secondaryColor;
  final String founderEmail;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateAssociationVariables.fromJson(Map<String, dynamic> json):
  
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

    final CreateAssociationVariables otherTyped = other as CreateAssociationVariables;
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

  CreateAssociationVariables({
    required this.name,
    required this.shortName,
    required this.subdomain,
    required this.primaryColor,
    required this.secondaryColor,
    required this.founderEmail,
  });
}

