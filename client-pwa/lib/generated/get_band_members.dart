part of 'samby.dart';

class GetBandMembersVariablesBuilder {
  String bandId;

  final FirebaseDataConnect _dataConnect;
  GetBandMembersVariablesBuilder(this._dataConnect, {required  this.bandId,});
  Deserializer<GetBandMembersData> dataDeserializer = (dynamic json)  => GetBandMembersData.fromJson(jsonDecode(json));
  Serializer<GetBandMembersVariables> varsSerializer = (GetBandMembersVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetBandMembersData, GetBandMembersVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetBandMembersData, GetBandMembersVariables> ref() {
    GetBandMembersVariables vars= GetBandMembersVariables(bandId: bandId,);
    return _dataConnect.query("GetBandMembers", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetBandMembersMembers {
  final String id;
  final String email;
  final String phone;
  final EnumValue<MemberRole> role;
  final String status;
  final bool isBlocked;
  final bool isFounder;
  final Timestamp createdAt;
  final String? name;
  final DateTime? birthDate;
  final String? idDoc;
  final String? idDocImageUrl;
  final String? profileImageUrl;
  final String? guardianName;
  final String? guardianIdDoc;
  final String? guardianIdDocImageUrl;
  final String? signatureUrl;
  final Timestamp? conditionsAcceptedAt;
  final Timestamp? minorConditionsAcceptedAt;
  final String? internalNotes;
  final Timestamp? requestedAt;
  final Timestamp? resolvedAt;
  GetBandMembersMembers.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  email = nativeFromJson<String>(json['email']),
  phone = nativeFromJson<String>(json['phone']),
  role = memberRoleDeserializer(json['role']),
  status = nativeFromJson<String>(json['status']),
  isBlocked = nativeFromJson<bool>(json['isBlocked']),
  isFounder = nativeFromJson<bool>(json['isFounder']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  name = json['name'] == null ? null : nativeFromJson<String>(json['name']),
  birthDate = json['birthDate'] == null ? null : nativeFromJson<DateTime>(json['birthDate']),
  idDoc = json['idDoc'] == null ? null : nativeFromJson<String>(json['idDoc']),
  idDocImageUrl = json['idDocImageUrl'] == null ? null : nativeFromJson<String>(json['idDocImageUrl']),
  profileImageUrl = json['profileImageUrl'] == null ? null : nativeFromJson<String>(json['profileImageUrl']),
  guardianName = json['guardianName'] == null ? null : nativeFromJson<String>(json['guardianName']),
  guardianIdDoc = json['guardianIdDoc'] == null ? null : nativeFromJson<String>(json['guardianIdDoc']),
  guardianIdDocImageUrl = json['guardianIdDocImageUrl'] == null ? null : nativeFromJson<String>(json['guardianIdDocImageUrl']),
  signatureUrl = json['signatureUrl'] == null ? null : nativeFromJson<String>(json['signatureUrl']),
  conditionsAcceptedAt = json['conditionsAcceptedAt'] == null ? null : Timestamp.fromJson(json['conditionsAcceptedAt']),
  minorConditionsAcceptedAt = json['minorConditionsAcceptedAt'] == null ? null : Timestamp.fromJson(json['minorConditionsAcceptedAt']),
  internalNotes = json['internalNotes'] == null ? null : nativeFromJson<String>(json['internalNotes']),
  requestedAt = json['requestedAt'] == null ? null : Timestamp.fromJson(json['requestedAt']),
  resolvedAt = json['resolvedAt'] == null ? null : Timestamp.fromJson(json['resolvedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandMembersMembers otherTyped = other as GetBandMembersMembers;
    return id == otherTyped.id && 
    email == otherTyped.email && 
    phone == otherTyped.phone && 
    role == otherTyped.role && 
    status == otherTyped.status && 
    isBlocked == otherTyped.isBlocked && 
    isFounder == otherTyped.isFounder && 
    createdAt == otherTyped.createdAt && 
    name == otherTyped.name && 
    birthDate == otherTyped.birthDate && 
    idDoc == otherTyped.idDoc && 
    idDocImageUrl == otherTyped.idDocImageUrl && 
    profileImageUrl == otherTyped.profileImageUrl && 
    guardianName == otherTyped.guardianName && 
    guardianIdDoc == otherTyped.guardianIdDoc && 
    guardianIdDocImageUrl == otherTyped.guardianIdDocImageUrl && 
    signatureUrl == otherTyped.signatureUrl && 
    conditionsAcceptedAt == otherTyped.conditionsAcceptedAt && 
    minorConditionsAcceptedAt == otherTyped.minorConditionsAcceptedAt && 
    internalNotes == otherTyped.internalNotes && 
    requestedAt == otherTyped.requestedAt && 
    resolvedAt == otherTyped.resolvedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, email.hashCode, phone.hashCode, role.hashCode, status.hashCode, isBlocked.hashCode, isFounder.hashCode, createdAt.hashCode, name.hashCode, birthDate.hashCode, idDoc.hashCode, idDocImageUrl.hashCode, profileImageUrl.hashCode, guardianName.hashCode, guardianIdDoc.hashCode, guardianIdDocImageUrl.hashCode, signatureUrl.hashCode, conditionsAcceptedAt.hashCode, minorConditionsAcceptedAt.hashCode, internalNotes.hashCode, requestedAt.hashCode, resolvedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['phone'] = nativeToJson<String>(phone);
    json['role'] = 
    memberRoleSerializer(role)
    ;
    json['status'] = nativeToJson<String>(status);
    json['isBlocked'] = nativeToJson<bool>(isBlocked);
    json['isFounder'] = nativeToJson<bool>(isFounder);
    json['createdAt'] = createdAt.toJson();
    if (name != null) {
      json['name'] = nativeToJson<String?>(name);
    }
    if (birthDate != null) {
      json['birthDate'] = nativeToJson<DateTime?>(birthDate);
    }
    if (idDoc != null) {
      json['idDoc'] = nativeToJson<String?>(idDoc);
    }
    if (idDocImageUrl != null) {
      json['idDocImageUrl'] = nativeToJson<String?>(idDocImageUrl);
    }
    if (profileImageUrl != null) {
      json['profileImageUrl'] = nativeToJson<String?>(profileImageUrl);
    }
    if (guardianName != null) {
      json['guardianName'] = nativeToJson<String?>(guardianName);
    }
    if (guardianIdDoc != null) {
      json['guardianIdDoc'] = nativeToJson<String?>(guardianIdDoc);
    }
    if (guardianIdDocImageUrl != null) {
      json['guardianIdDocImageUrl'] = nativeToJson<String?>(guardianIdDocImageUrl);
    }
    if (signatureUrl != null) {
      json['signatureUrl'] = nativeToJson<String?>(signatureUrl);
    }
    if (conditionsAcceptedAt != null) {
      json['conditionsAcceptedAt'] = conditionsAcceptedAt!.toJson();
    }
    if (minorConditionsAcceptedAt != null) {
      json['minorConditionsAcceptedAt'] = minorConditionsAcceptedAt!.toJson();
    }
    if (internalNotes != null) {
      json['internalNotes'] = nativeToJson<String?>(internalNotes);
    }
    if (requestedAt != null) {
      json['requestedAt'] = requestedAt!.toJson();
    }
    if (resolvedAt != null) {
      json['resolvedAt'] = resolvedAt!.toJson();
    }
    return json;
  }

  GetBandMembersMembers({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
    required this.status,
    required this.isBlocked,
    required this.isFounder,
    required this.createdAt,
    this.name,
    this.birthDate,
    this.idDoc,
    this.idDocImageUrl,
    this.profileImageUrl,
    this.guardianName,
    this.guardianIdDoc,
    this.guardianIdDocImageUrl,
    this.signatureUrl,
    this.conditionsAcceptedAt,
    this.minorConditionsAcceptedAt,
    this.internalNotes,
    this.requestedAt,
    this.resolvedAt,
  });
}

@immutable
class GetBandMembersData {
  final List<GetBandMembersMembers> members;
  GetBandMembersData.fromJson(dynamic json):
  
  members = (json['members'] as List<dynamic>)
        .map((e) => GetBandMembersMembers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandMembersData otherTyped = other as GetBandMembersData;
    return members == otherTyped.members;
    
  }
  @override
  int get hashCode => members.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['members'] = members.map((e) => e.toJson()).toList();
    return json;
  }

  GetBandMembersData({
    required this.members,
  });
}

@immutable
class GetBandMembersVariables {
  final String bandId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetBandMembersVariables.fromJson(Map<String, dynamic> json):
  
  bandId = nativeFromJson<String>(json['bandId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandMembersVariables otherTyped = other as GetBandMembersVariables;
    return bandId == otherTyped.bandId;
    
  }
  @override
  int get hashCode => bandId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandId'] = nativeToJson<String>(bandId);
    return json;
  }

  GetBandMembersVariables({
    required this.bandId,
  });
}

