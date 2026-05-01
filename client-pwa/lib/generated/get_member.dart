part of 'samby.dart';

class GetMemberVariablesBuilder {
  String memberId;

  final FirebaseDataConnect _dataConnect;
  GetMemberVariablesBuilder(this._dataConnect, {required  this.memberId,});
  Deserializer<GetMemberData> dataDeserializer = (dynamic json)  => GetMemberData.fromJson(jsonDecode(json));
  Serializer<GetMemberVariables> varsSerializer = (GetMemberVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetMemberData, GetMemberVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetMemberData, GetMemberVariables> ref() {
    GetMemberVariables vars= GetMemberVariables(memberId: memberId,);
    return _dataConnect.query("GetMember", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetMemberMember {
  final String id;
  final GetMemberMemberAssociation association;
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
  GetMemberMember.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  association = GetMemberMemberAssociation.fromJson(json['association']),
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

    final GetMemberMember otherTyped = other as GetMemberMember;
    return id == otherTyped.id && 
    association == otherTyped.association && 
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
  int get hashCode => Object.hashAll([id.hashCode, association.hashCode, email.hashCode, phone.hashCode, role.hashCode, status.hashCode, isBlocked.hashCode, isFounder.hashCode, createdAt.hashCode, name.hashCode, birthDate.hashCode, idDoc.hashCode, idDocImageUrl.hashCode, profileImageUrl.hashCode, guardianName.hashCode, guardianIdDoc.hashCode, guardianIdDocImageUrl.hashCode, signatureUrl.hashCode, conditionsAcceptedAt.hashCode, minorConditionsAcceptedAt.hashCode, internalNotes.hashCode, requestedAt.hashCode, resolvedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['association'] = association.toJson();
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

  GetMemberMember({
    required this.id,
    required this.association,
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
class GetMemberMemberAssociation {
  final String id;
  GetMemberMemberAssociation.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberMemberAssociation otherTyped = other as GetMemberMemberAssociation;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetMemberMemberAssociation({
    required this.id,
  });
}

@immutable
class GetMemberData {
  final GetMemberMember? member;
  GetMemberData.fromJson(dynamic json):
  
  member = json['member'] == null ? null : GetMemberMember.fromJson(json['member']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberData otherTyped = other as GetMemberData;
    return member == otherTyped.member;
    
  }
  @override
  int get hashCode => member.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (member != null) {
      json['member'] = member!.toJson();
    }
    return json;
  }

  GetMemberData({
    this.member,
  });
}

@immutable
class GetMemberVariables {
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetMemberVariables.fromJson(Map<String, dynamic> json):
  
  memberId = nativeFromJson<String>(json['memberId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberVariables otherTyped = other as GetMemberVariables;
    return memberId == otherTyped.memberId;
    
  }
  @override
  int get hashCode => memberId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['memberId'] = nativeToJson<String>(memberId);
    return json;
  }

  GetMemberVariables({
    required this.memberId,
  });
}

