part of 'samby.dart';

class GetAssociationByFounderEmailVariablesBuilder {
  String founderEmail;

  final FirebaseDataConnect _dataConnect;
  GetAssociationByFounderEmailVariablesBuilder(this._dataConnect, {required  this.founderEmail,});
  Deserializer<GetAssociationByFounderEmailData> dataDeserializer = (dynamic json)  => GetAssociationByFounderEmailData.fromJson(jsonDecode(json));
  Serializer<GetAssociationByFounderEmailVariables> varsSerializer = (GetAssociationByFounderEmailVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAssociationByFounderEmailData, GetAssociationByFounderEmailVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetAssociationByFounderEmailData, GetAssociationByFounderEmailVariables> ref() {
    GetAssociationByFounderEmailVariables vars= GetAssociationByFounderEmailVariables(founderEmail: founderEmail,);
    return _dataConnect.query("GetAssociationByFounderEmail", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetAssociationByFounderEmailAssociation {
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
  GetAssociationByFounderEmailAssociation.fromJson(dynamic json):
  
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

    final GetAssociationByFounderEmailAssociation otherTyped = other as GetAssociationByFounderEmailAssociation;
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

  GetAssociationByFounderEmailAssociation({
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
class GetAssociationByFounderEmailData {
  final GetAssociationByFounderEmailAssociation? association;
  GetAssociationByFounderEmailData.fromJson(dynamic json):
  
  association = json['association'] == null ? null : GetAssociationByFounderEmailAssociation.fromJson(json['association']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationByFounderEmailData otherTyped = other as GetAssociationByFounderEmailData;
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

  GetAssociationByFounderEmailData({
    this.association,
  });
}

@immutable
class GetAssociationByFounderEmailVariables {
  final String founderEmail;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetAssociationByFounderEmailVariables.fromJson(Map<String, dynamic> json):
  
  founderEmail = nativeFromJson<String>(json['founderEmail']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationByFounderEmailVariables otherTyped = other as GetAssociationByFounderEmailVariables;
    return founderEmail == otherTyped.founderEmail;
    
  }
  @override
  int get hashCode => founderEmail.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['founderEmail'] = nativeToJson<String>(founderEmail);
    return json;
  }

  GetAssociationByFounderEmailVariables({
    required this.founderEmail,
  });
}

