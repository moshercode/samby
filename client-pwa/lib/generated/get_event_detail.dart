part of 'samby.dart';

class GetEventDetailVariablesBuilder {
  String eventId;

  final FirebaseDataConnect _dataConnect;
  GetEventDetailVariablesBuilder(this._dataConnect, {required  this.eventId,});
  Deserializer<GetEventDetailData> dataDeserializer = (dynamic json)  => GetEventDetailData.fromJson(jsonDecode(json));
  Serializer<GetEventDetailVariables> varsSerializer = (GetEventDetailVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetEventDetailData, GetEventDetailVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetEventDetailData, GetEventDetailVariables> ref() {
    GetEventDetailVariables vars= GetEventDetailVariables(eventId: eventId,);
    return _dataConnect.query("GetEventDetail", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetEventDetailEvent {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Timestamp? startDate;
  final Timestamp? endDate;
  final EnumValue<EventStatus> status;
  final bool freeEntry;
  final String? entryCondition;
  final Timestamp? updatedAt;
  final Timestamp createdAt;
  final List<GetEventDetailEventEventAppointmentsOnEvent> eventAppointments_on_event;
  final List<GetEventDetailEventEventMembersOnEvent> eventMembers_on_event;
  GetEventDetailEvent.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  imageUrl = nativeFromJson<String>(json['imageUrl']),
  startDate = json['startDate'] == null ? null : Timestamp.fromJson(json['startDate']),
  endDate = json['endDate'] == null ? null : Timestamp.fromJson(json['endDate']),
  status = eventStatusDeserializer(json['status']),
  freeEntry = nativeFromJson<bool>(json['freeEntry']),
  entryCondition = json['entryCondition'] == null ? null : nativeFromJson<String>(json['entryCondition']),
  updatedAt = json['updatedAt'] == null ? null : Timestamp.fromJson(json['updatedAt']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  eventAppointments_on_event = (json['eventAppointments_on_event'] as List<dynamic>)
        .map((e) => GetEventDetailEventEventAppointmentsOnEvent.fromJson(e))
        .toList(),
  eventMembers_on_event = (json['eventMembers_on_event'] as List<dynamic>)
        .map((e) => GetEventDetailEventEventMembersOnEvent.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailEvent otherTyped = other as GetEventDetailEvent;
    return id == otherTyped.id && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    imageUrl == otherTyped.imageUrl && 
    startDate == otherTyped.startDate && 
    endDate == otherTyped.endDate && 
    status == otherTyped.status && 
    freeEntry == otherTyped.freeEntry && 
    entryCondition == otherTyped.entryCondition && 
    updatedAt == otherTyped.updatedAt && 
    createdAt == otherTyped.createdAt && 
    eventAppointments_on_event == otherTyped.eventAppointments_on_event && 
    eventMembers_on_event == otherTyped.eventMembers_on_event;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, imageUrl.hashCode, startDate.hashCode, endDate.hashCode, status.hashCode, freeEntry.hashCode, entryCondition.hashCode, updatedAt.hashCode, createdAt.hashCode, eventAppointments_on_event.hashCode, eventMembers_on_event.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    if (startDate != null) {
      json['startDate'] = startDate!.toJson();
    }
    if (endDate != null) {
      json['endDate'] = endDate!.toJson();
    }
    json['status'] = 
    eventStatusSerializer(status)
    ;
    json['freeEntry'] = nativeToJson<bool>(freeEntry);
    if (entryCondition != null) {
      json['entryCondition'] = nativeToJson<String?>(entryCondition);
    }
    if (updatedAt != null) {
      json['updatedAt'] = updatedAt!.toJson();
    }
    json['createdAt'] = createdAt.toJson();
    json['eventAppointments_on_event'] = eventAppointments_on_event.map((e) => e.toJson()).toList();
    json['eventMembers_on_event'] = eventMembers_on_event.map((e) => e.toJson()).toList();
    return json;
  }

  GetEventDetailEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.startDate,
    this.endDate,
    required this.status,
    required this.freeEntry,
    this.entryCondition,
    this.updatedAt,
    required this.createdAt,
    required this.eventAppointments_on_event,
    required this.eventMembers_on_event,
  });
}

@immutable
class GetEventDetailEventEventAppointmentsOnEvent {
  final String id;
  final String title;
  final String description;
  final Timestamp eventDate;
  final Timestamp? endDate;
  final Timestamp createdAt;
  GetEventDetailEventEventAppointmentsOnEvent.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  eventDate = Timestamp.fromJson(json['eventDate']),
  endDate = json['endDate'] == null ? null : Timestamp.fromJson(json['endDate']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailEventEventAppointmentsOnEvent otherTyped = other as GetEventDetailEventEventAppointmentsOnEvent;
    return id == otherTyped.id && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    eventDate == otherTyped.eventDate && 
    endDate == otherTyped.endDate && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, eventDate.hashCode, endDate.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['eventDate'] = eventDate.toJson();
    if (endDate != null) {
      json['endDate'] = endDate!.toJson();
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetEventDetailEventEventAppointmentsOnEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.eventDate,
    this.endDate,
    required this.createdAt,
  });
}

@immutable
class GetEventDetailEventEventMembersOnEvent {
  final String id;
  final String status;
  final GetEventDetailEventEventMembersOnEventMember member;
  GetEventDetailEventEventMembersOnEvent.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  status = nativeFromJson<String>(json['status']),
  member = GetEventDetailEventEventMembersOnEventMember.fromJson(json['member']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailEventEventMembersOnEvent otherTyped = other as GetEventDetailEventEventMembersOnEvent;
    return id == otherTyped.id && 
    status == otherTyped.status && 
    member == otherTyped.member;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, status.hashCode, member.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['status'] = nativeToJson<String>(status);
    json['member'] = member.toJson();
    return json;
  }

  GetEventDetailEventEventMembersOnEvent({
    required this.id,
    required this.status,
    required this.member,
  });
}

@immutable
class GetEventDetailEventEventMembersOnEventMember {
  final String id;
  final String? name;
  GetEventDetailEventEventMembersOnEventMember.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = json['name'] == null ? null : nativeFromJson<String>(json['name']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailEventEventMembersOnEventMember otherTyped = other as GetEventDetailEventEventMembersOnEventMember;
    return id == otherTyped.id && 
    name == otherTyped.name;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if (name != null) {
      json['name'] = nativeToJson<String?>(name);
    }
    return json;
  }

  GetEventDetailEventEventMembersOnEventMember({
    required this.id,
    this.name,
  });
}

@immutable
class GetEventDetailData {
  final GetEventDetailEvent? event;
  GetEventDetailData.fromJson(dynamic json):
  
  event = json['event'] == null ? null : GetEventDetailEvent.fromJson(json['event']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailData otherTyped = other as GetEventDetailData;
    return event == otherTyped.event;
    
  }
  @override
  int get hashCode => event.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (event != null) {
      json['event'] = event!.toJson();
    }
    return json;
  }

  GetEventDetailData({
    this.event,
  });
}

@immutable
class GetEventDetailVariables {
  final String eventId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetEventDetailVariables.fromJson(Map<String, dynamic> json):
  
  eventId = nativeFromJson<String>(json['eventId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventDetailVariables otherTyped = other as GetEventDetailVariables;
    return eventId == otherTyped.eventId;
    
  }
  @override
  int get hashCode => eventId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventId'] = nativeToJson<String>(eventId);
    return json;
  }

  GetEventDetailVariables({
    required this.eventId,
  });
}

