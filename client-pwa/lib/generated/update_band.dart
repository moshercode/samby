part of 'samby.dart';

class UpdateBandVariablesBuilder {
  String id;
  bool requireIdDoc;
  bool requireIdDocImage;
  bool requireGuardian;

  final FirebaseDataConnect _dataConnect;
  UpdateBandVariablesBuilder(this._dataConnect, {required  this.id,required  this.requireIdDoc,required  this.requireIdDocImage,required  this.requireGuardian,});
  Deserializer<UpdateBandData> dataDeserializer = (dynamic json)  => UpdateBandData.fromJson(jsonDecode(json));
  Serializer<UpdateBandVariables> varsSerializer = (UpdateBandVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateBandData, UpdateBandVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateBandData, UpdateBandVariables> ref() {
    UpdateBandVariables vars= UpdateBandVariables(id: id,requireIdDoc: requireIdDoc,requireIdDocImage: requireIdDocImage,requireGuardian: requireGuardian,);
    return _dataConnect.mutation("UpdateBand", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateBandBandUpdate {
  final String id;
  UpdateBandBandUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateBandBandUpdate otherTyped = other as UpdateBandBandUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateBandBandUpdate({
    required this.id,
  });
}

@immutable
class UpdateBandData {
  final UpdateBandBandUpdate? band_update;
  UpdateBandData.fromJson(dynamic json):
  
  band_update = json['band_update'] == null ? null : UpdateBandBandUpdate.fromJson(json['band_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateBandData otherTyped = other as UpdateBandData;
    return band_update == otherTyped.band_update;
    
  }
  @override
  int get hashCode => band_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (band_update != null) {
      json['band_update'] = band_update!.toJson();
    }
    return json;
  }

  UpdateBandData({
    this.band_update,
  });
}

@immutable
class UpdateBandVariables {
  final String id;
  final bool requireIdDoc;
  final bool requireIdDocImage;
  final bool requireGuardian;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateBandVariables.fromJson(Map<String, dynamic> json):
  
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

    final UpdateBandVariables otherTyped = other as UpdateBandVariables;
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

  UpdateBandVariables({
    required this.id,
    required this.requireIdDoc,
    required this.requireIdDocImage,
    required this.requireGuardian,
  });
}

