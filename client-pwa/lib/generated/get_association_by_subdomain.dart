part of 'samby.dart';

class GetAssociationBySubdomainVariablesBuilder {
  String subdomain;

  final FirebaseDataConnect _dataConnect;
  GetAssociationBySubdomainVariablesBuilder(this._dataConnect, {required  this.subdomain,});
  Deserializer<GetAssociationBySubdomainData> dataDeserializer = (dynamic json)  => GetAssociationBySubdomainData.fromJson(jsonDecode(json));
  Serializer<GetAssociationBySubdomainVariables> varsSerializer = (GetAssociationBySubdomainVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAssociationBySubdomainData, GetAssociationBySubdomainVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetAssociationBySubdomainData, GetAssociationBySubdomainVariables> ref() {
    GetAssociationBySubdomainVariables vars= GetAssociationBySubdomainVariables(subdomain: subdomain,);
    return _dataConnect.query("GetAssociationBySubdomain", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetAssociationBySubdomainAssociation {
  final String id;
  final String name;
  final String shortName;
  final String subdomain;
  final String logoUrl;
  final String iconUrl;
  final String primaryColor;
  final String secondaryColor;
  final String founderEmail;
  final bool requireIdDoc;
  final bool requireIdDocImage;
  final bool requireGuardian;
  final bool active;
  final Timestamp createdAt;
  GetAssociationBySubdomainAssociation.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  shortName = nativeFromJson<String>(json['shortName']),
  subdomain = nativeFromJson<String>(json['subdomain']),
  logoUrl = nativeFromJson<String>(json['logoUrl']),
  iconUrl = nativeFromJson<String>(json['iconUrl']),
  primaryColor = nativeFromJson<String>(json['primaryColor']),
  secondaryColor = nativeFromJson<String>(json['secondaryColor']),
  founderEmail = nativeFromJson<String>(json['founderEmail']),
  requireIdDoc = nativeFromJson<bool>(json['requireIdDoc']),
  requireIdDocImage = nativeFromJson<bool>(json['requireIdDocImage']),
  requireGuardian = nativeFromJson<bool>(json['requireGuardian']),
  active = nativeFromJson<bool>(json['active']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationBySubdomainAssociation otherTyped = other as GetAssociationBySubdomainAssociation;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    shortName == otherTyped.shortName && 
    subdomain == otherTyped.subdomain && 
    logoUrl == otherTyped.logoUrl && 
    iconUrl == otherTyped.iconUrl && 
    primaryColor == otherTyped.primaryColor && 
    secondaryColor == otherTyped.secondaryColor && 
    founderEmail == otherTyped.founderEmail && 
    requireIdDoc == otherTyped.requireIdDoc && 
    requireIdDocImage == otherTyped.requireIdDocImage && 
    requireGuardian == otherTyped.requireGuardian && 
    active == otherTyped.active && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, shortName.hashCode, subdomain.hashCode, logoUrl.hashCode, iconUrl.hashCode, primaryColor.hashCode, secondaryColor.hashCode, founderEmail.hashCode, requireIdDoc.hashCode, requireIdDocImage.hashCode, requireGuardian.hashCode, active.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['shortName'] = nativeToJson<String>(shortName);
    json['subdomain'] = nativeToJson<String>(subdomain);
    json['logoUrl'] = nativeToJson<String>(logoUrl);
    json['iconUrl'] = nativeToJson<String>(iconUrl);
    json['primaryColor'] = nativeToJson<String>(primaryColor);
    json['secondaryColor'] = nativeToJson<String>(secondaryColor);
    json['founderEmail'] = nativeToJson<String>(founderEmail);
    json['requireIdDoc'] = nativeToJson<bool>(requireIdDoc);
    json['requireIdDocImage'] = nativeToJson<bool>(requireIdDocImage);
    json['requireGuardian'] = nativeToJson<bool>(requireGuardian);
    json['active'] = nativeToJson<bool>(active);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetAssociationBySubdomainAssociation({
    required this.id,
    required this.name,
    required this.shortName,
    required this.subdomain,
    required this.logoUrl,
    required this.iconUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.founderEmail,
    required this.requireIdDoc,
    required this.requireIdDocImage,
    required this.requireGuardian,
    required this.active,
    required this.createdAt,
  });
}

@immutable
class GetAssociationBySubdomainData {
  final GetAssociationBySubdomainAssociation? association;
  GetAssociationBySubdomainData.fromJson(dynamic json):
  
  association = json['association'] == null ? null : GetAssociationBySubdomainAssociation.fromJson(json['association']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationBySubdomainData otherTyped = other as GetAssociationBySubdomainData;
    return association == otherTyped.association;
    
  }
  @override
  int get hashCode => association.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (association != null) {
      json['association'] = association!.toJson();
    }
    return json;
  }

  GetAssociationBySubdomainData({
    this.association,
  });
}

@immutable
class GetAssociationBySubdomainVariables {
  final String subdomain;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetAssociationBySubdomainVariables.fromJson(Map<String, dynamic> json):
  
  subdomain = nativeFromJson<String>(json['subdomain']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationBySubdomainVariables otherTyped = other as GetAssociationBySubdomainVariables;
    return subdomain == otherTyped.subdomain;
    
  }
  @override
  int get hashCode => subdomain.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['subdomain'] = nativeToJson<String>(subdomain);
    return json;
  }

  GetAssociationBySubdomainVariables({
    required this.subdomain,
  });
}

