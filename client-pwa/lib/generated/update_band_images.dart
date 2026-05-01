part of 'samby.dart';

class UpdateBandImagesVariablesBuilder {
  String id;
  String logoUrl;
  String iconUrl;

  final FirebaseDataConnect _dataConnect;
  UpdateBandImagesVariablesBuilder(this._dataConnect, {required  this.id,required  this.logoUrl,required  this.iconUrl,});
  Deserializer<UpdateBandImagesData> dataDeserializer = (dynamic json)  => UpdateBandImagesData.fromJson(jsonDecode(json));
  Serializer<UpdateBandImagesVariables> varsSerializer = (UpdateBandImagesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateBandImagesData, UpdateBandImagesVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateBandImagesData, UpdateBandImagesVariables> ref() {
    UpdateBandImagesVariables vars= UpdateBandImagesVariables(id: id,logoUrl: logoUrl,iconUrl: iconUrl,);
    return _dataConnect.mutation("UpdateBandImages", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateBandImagesBandUpdate {
  final String id;
  UpdateBandImagesBandUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateBandImagesBandUpdate otherTyped = other as UpdateBandImagesBandUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateBandImagesBandUpdate({
    required this.id,
  });
}

@immutable
class UpdateBandImagesData {
  final UpdateBandImagesBandUpdate? band_update;
  UpdateBandImagesData.fromJson(dynamic json):
  
  band_update = json['band_update'] == null ? null : UpdateBandImagesBandUpdate.fromJson(json['band_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateBandImagesData otherTyped = other as UpdateBandImagesData;
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

  UpdateBandImagesData({
    this.band_update,
  });
}

@immutable
class UpdateBandImagesVariables {
  final String id;
  final String logoUrl;
  final String iconUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateBandImagesVariables.fromJson(Map<String, dynamic> json):
  
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

    final UpdateBandImagesVariables otherTyped = other as UpdateBandImagesVariables;
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

  UpdateBandImagesVariables({
    required this.id,
    required this.logoUrl,
    required this.iconUrl,
  });
}

