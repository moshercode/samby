part of 'samby.dart';

class UpdateAssociationVariablesBuilder {
  String id;
  bool requireIdDoc;
  bool requireIdDocImage;
  bool requireGuardian;

  final FirebaseDataConnect _dataConnect;
  UpdateAssociationVariablesBuilder(this._dataConnect, {required  this.id,required  this.requireIdDoc,required  this.requireIdDocImage,required  this.requireGuardian,});
  Deserializer<UpdateAssociationData> dataDeserializer = (dynamic json)  => UpdateAssociationData.fromJson(jsonDecode(json));
  Serializer<UpdateAssociationVariables> varsSerializer = (UpdateAssociationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateAssociationData, UpdateAssociationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateAssociationData, UpdateAssociationVariables> ref() {
    UpdateAssociationVariables vars= UpdateAssociationVariables(id: id,requireIdDoc: requireIdDoc,requireIdDocImage: requireIdDocImage,requireGuardian: requireGuardian,);
    return _dataConnect.mutation("UpdateAssociation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateAssociationAssociationUpdate {
  final String id;
  UpdateAssociationAssociationUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationAssociationUpdate otherTyped = other as UpdateAssociationAssociationUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateAssociationAssociationUpdate({
    required this.id,
  });
}

@immutable
class UpdateAssociationData {
  final UpdateAssociationAssociationUpdate? association_update;
  UpdateAssociationData.fromJson(dynamic json):
  
  association_update = json['association_update'] == null ? null : UpdateAssociationAssociationUpdate.fromJson(json['association_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationData otherTyped = other as UpdateAssociationData;
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

  UpdateAssociationData({
    this.association_update,
  });
}

@immutable
class UpdateAssociationVariables {
  final String id;
  final bool requireIdDoc;
  final bool requireIdDocImage;
  final bool requireGuardian;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateAssociationVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  requireIdDoc = nativeFromJson<bool>(json['requireIdDoc']),
  requireIdDocImage = nativeFromJson<bool>(json['requireIdDocImage']),
  requireGuardian = nativeFromJson<bool>(json['requireGuardian']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAssociationVariables otherTyped = other as UpdateAssociationVariables;
    return id == otherTyped.id && 
    requireIdDoc == otherTyped.requireIdDoc && 
    requireIdDocImage == otherTyped.requireIdDocImage && 
    requireGuardian == otherTyped.requireGuardian;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, requireIdDoc.hashCode, requireIdDocImage.hashCode, requireGuardian.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['requireIdDoc'] = nativeToJson<bool>(requireIdDoc);
    json['requireIdDocImage'] = nativeToJson<bool>(requireIdDocImage);
    json['requireGuardian'] = nativeToJson<bool>(requireGuardian);
    return json;
  }

  UpdateAssociationVariables({
    required this.id,
    required this.requireIdDoc,
    required this.requireIdDocImage,
    required this.requireGuardian,
  });
}

