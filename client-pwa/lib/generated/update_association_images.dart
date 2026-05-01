part of 'samby.dart';

class UpdateAssociationImagesVariablesBuilder {
  String id;
  String logoUrl;
  String iconUrl;

  final FirebaseDataConnect _dataConnect;
  UpdateAssociationImagesVariablesBuilder(this._dataConnect, {required  this.id,required  this.logoUrl,required  this.iconUrl,});
  Deserializer<UpdateAssociationImagesData> dataDeserializer = (dynamic json)  => UpdateAssociationImagesData.fromJson(jsonDecode(json));
  Serializer<UpdateAssociationImagesVariables> varsSerializer = (UpdateAssociationImagesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateAssociationImagesData, UpdateAssociationImagesVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateAssociationImagesData, UpdateAssociationImagesVariables> ref() {
    UpdateAssociationImagesVariables vars= UpdateAssociationImagesVariables(id: id,logoUrl: logoUrl,iconUrl: iconUrl,);
    return _dataConnect.mutation("UpdateAssociationImages", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateAssociationImagesAssociationUpdate {
  final String id;
  UpdateAssociationImagesAssociationUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationImagesAssociationUpdate otherTyped = other as UpdateAssociationImagesAssociationUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateAssociationImagesAssociationUpdate({
    required this.id,
  });
}

@immutable
class UpdateAssociationImagesData {
  final UpdateAssociationImagesAssociationUpdate? association_update;
  UpdateAssociationImagesData.fromJson(dynamic json):
  
  association_update = json['association_update'] == null ? null : UpdateAssociationImagesAssociationUpdate.fromJson(json['association_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationImagesData otherTyped = other as UpdateAssociationImagesData;
    return association_update == otherTyped.association_update;
    
  }
  @override
  int get hashCode => association_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (association_update != null) {
      json['association_update'] = association_update!.toJson();
    }
    return json;
  }

  UpdateAssociationImagesData({
    this.association_update,
  });
}

@immutable
class UpdateAssociationImagesVariables {
  final String id;
  final String logoUrl;
  final String iconUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateAssociationImagesVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  logoUrl = nativeFromJson<String>(json['logoUrl']),
  iconUrl = nativeFromJson<String>(json['iconUrl']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationImagesVariables otherTyped = other as UpdateAssociationImagesVariables;
    return id == otherTyped.id && 
    logoUrl == otherTyped.logoUrl && 
    iconUrl == otherTyped.iconUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, logoUrl.hashCode, iconUrl.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['logoUrl'] = nativeToJson<String>(logoUrl);
    json['iconUrl'] = nativeToJson<String>(iconUrl);
    return json;
  }

  UpdateAssociationImagesVariables({
    required this.id,
    required this.logoUrl,
    required this.iconUrl,
  });
}

