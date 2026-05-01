part of 'samby.dart';

class ResetMemberApplicationVariablesBuilder {
  String id;
  String name;
  DateTime birthDate;
  String idDoc;
  String idDocImageUrl;
  Optional<String> _guardianName = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _guardianIdDoc = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _guardianIdDocImageUrl = Optional.optional(nativeFromJson, nativeToJson);
  String signatureUrl;
  Timestamp conditionsAcceptedAt;
  Optional<Timestamp> _minorConditionsAcceptedAt = Optional.optional((json) => json['minorConditionsAcceptedAt'] = Timestamp.fromJson(json['minorConditionsAcceptedAt']), defaultSerializer);
  Timestamp requestedAt;

  final FirebaseDataConnect _dataConnect;  ResetMemberApplicationVariablesBuilder guardianName(String? t) {
   _guardianName.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder guardianIdDoc(String? t) {
   _guardianIdDoc.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder guardianIdDocImageUrl(String? t) {
   _guardianIdDocImageUrl.value = t;
   return this;
  }
  ResetMemberApplicationVariablesBuilder minorConditionsAcceptedAt(Timestamp? t) {
   _minorConditionsAcceptedAt.value = t;
   return this;
  }

  ResetMemberApplicationVariablesBuilder(this._dataConnect, {required  this.id,required  this.name,required  this.birthDate,required  this.idDoc,required  this.idDocImageUrl,required  this.signatureUrl,required  this.conditionsAcceptedAt,required  this.requestedAt,});
  Deserializer<ResetMemberApplicationData> dataDeserializer = (dynamic json)  => ResetMemberApplicationData.fromJson(jsonDecode(json));
  Serializer<ResetMemberApplicationVariables> varsSerializer = (ResetMemberApplicationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ResetMemberApplicationData, ResetMemberApplicationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ResetMemberApplicationData, ResetMemberApplicationVariables> ref() {
    ResetMemberApplicationVariables vars= ResetMemberApplicationVariables(id: id,name: name,birthDate: birthDate,idDoc: idDoc,idDocImageUrl: idDocImageUrl,guardianName: _guardianName,guardianIdDoc: _guardianIdDoc,guardianIdDocImageUrl: _guardianIdDocImageUrl,signatureUrl: signatureUrl,conditionsAcceptedAt: conditionsAcceptedAt,minorConditionsAcceptedAt: _minorConditionsAcceptedAt,requestedAt: requestedAt,);
    return _dataConnect.mutation("ResetMemberApplication", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ResetMemberApplicationMemberUpdate {
  final String id;
  ResetMemberApplicationMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResetMemberApplicationMemberUpdate otherTyped = other as ResetMemberApplicationMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  ResetMemberApplicationMemberUpdate({
    required this.id,
  });
}

@immutable
class ResetMemberApplicationData {
  final ResetMemberApplicationMemberUpdate? member_update;
  ResetMemberApplicationData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : ResetMemberApplicationMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResetMemberApplicationData otherTyped = other as ResetMemberApplicationData;
    return member_update == otherTyped.member_update;
    
  }
  @override
  int get hashCode => member_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (member_update != null) {
      json['member_update'] = member_update!.toJson();
    }
    return json;
  }

  ResetMemberApplicationData({
    this.member_update,
  });
}

@immutable
class ResetMemberApplicationVariables {
  final String id;
  final String name;
  final DateTime birthDate;
  final String idDoc;
  final String idDocImageUrl;
  late final Optional<String>guardianName;
  late final Optional<String>guardianIdDoc;
  late final Optional<String>guardianIdDocImageUrl;
  final String signatureUrl;
  final Timestamp conditionsAcceptedAt;
  late final Optional<Timestamp>minorConditionsAcceptedAt;
  final Timestamp requestedAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ResetMemberApplicationVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  birthDate = nativeFromJson<DateTime>(json['birthDate']),
  idDoc = nativeFromJson<String>(json['idDoc']),
  idDocImageUrl = nativeFromJson<String>(json['idDocImageUrl']),
  signatureUrl = nativeFromJson<String>(json['signatureUrl']),
  conditionsAcceptedAt = Timestamp.fromJson(json['conditionsAcceptedAt']),
  requestedAt = Timestamp.fromJson(json['requestedAt']) {
  
  
  
  
  
  
  
    guardianName = Optional.optional(nativeFromJson, nativeToJson);
    guardianName.value = json['guardianName'] == null ? null : nativeFromJson<String>(json['guardianName']);
  
  
    guardianIdDoc = Optional.optional(nativeFromJson, nativeToJson);
    guardianIdDoc.value = json['guardianIdDoc'] == null ? null : nativeFromJson<String>(json['guardianIdDoc']);
  
  
    guardianIdDocImageUrl = Optional.optional(nativeFromJson, nativeToJson);
    guardianIdDocImageUrl.value = json['guardianIdDocImageUrl'] == null ? null : nativeFromJson<String>(json['guardianIdDocImageUrl']);
  
  
  
  
    minorConditionsAcceptedAt = Optional.optional((json) => json['minorConditionsAcceptedAt'] = Timestamp.fromJson(json['minorConditionsAcceptedAt']), defaultSerializer);
    minorConditionsAcceptedAt.value = json['minorConditionsAcceptedAt'] == null ? null : Timestamp.fromJson(json['minorConditionsAcceptedAt']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResetMemberApplicationVariables otherTyped = other as ResetMemberApplicationVariables;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    birthDate == otherTyped.birthDate && 
    idDoc == otherTyped.idDoc && 
    idDocImageUrl == otherTyped.idDocImageUrl && 
    guardianName == otherTyped.guardianName && 
    guardianIdDoc == otherTyped.guardianIdDoc && 
    guardianIdDocImageUrl == otherTyped.guardianIdDocImageUrl && 
    signatureUrl == otherTyped.signatureUrl && 
    conditionsAcceptedAt == otherTyped.conditionsAcceptedAt && 
    minorConditionsAcceptedAt == otherTyped.minorConditionsAcceptedAt && 
    requestedAt == otherTyped.requestedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, birthDate.hashCode, idDoc.hashCode, idDocImageUrl.hashCode, guardianName.hashCode, guardianIdDoc.hashCode, guardianIdDocImageUrl.hashCode, signatureUrl.hashCode, conditionsAcceptedAt.hashCode, minorConditionsAcceptedAt.hashCode, requestedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['birthDate'] = nativeToJson<DateTime>(birthDate);
    json['idDoc'] = nativeToJson<String>(idDoc);
    json['idDocImageUrl'] = nativeToJson<String>(idDocImageUrl);
    if(guardianName.state == OptionalState.set) {
      json['guardianName'] = guardianName.toJson();
    }
    if(guardianIdDoc.state == OptionalState.set) {
      json['guardianIdDoc'] = guardianIdDoc.toJson();
    }
    if(guardianIdDocImageUrl.state == OptionalState.set) {
      json['guardianIdDocImageUrl'] = guardianIdDocImageUrl.toJson();
    }
    json['signatureUrl'] = nativeToJson<String>(signatureUrl);
    json['conditionsAcceptedAt'] = conditionsAcceptedAt.toJson();
    if(minorConditionsAcceptedAt.state == OptionalState.set) {
      json['minorConditionsAcceptedAt'] = minorConditionsAcceptedAt.toJson();
    }
    json['requestedAt'] = requestedAt.toJson();
    return json;
  }

  ResetMemberApplicationVariables({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.idDoc,
    required this.idDocImageUrl,
    required this.guardianName,
    required this.guardianIdDoc,
    required this.guardianIdDocImageUrl,
    required this.signatureUrl,
    required this.conditionsAcceptedAt,
    required this.minorConditionsAcceptedAt,
    required this.requestedAt,
  });
}

