part of 'samby.dart';

class GetBandEventsVariablesBuilder {
  String bandId;

  final FirebaseDataConnect _dataConnect;
  GetBandEventsVariablesBuilder(this._dataConnect, {required  this.bandId,});
  Deserializer<GetBandEventsData> dataDeserializer = (dynamic json)  => GetBandEventsData.fromJson(jsonDecode(json));
  Serializer<GetBandEventsVariables> varsSerializer = (GetBandEventsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetBandEventsData, GetBandEventsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetBandEventsData, GetBandEventsVariables> ref() {
    GetBandEventsVariables vars= GetBandEventsVariables(bandId: bandId,);
    return _dataConnect.query("GetBandEvents", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetBandEventsEvents {
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
  final List<GetBandEventsEventsEventMembersOnEvent> eventMembers_on_event;
  GetBandEventsEvents.fromJson(dynamic json):
  
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
  eventMembers_on_event = (json['eventMembers_on_event'] as List<dynamic>)
        .map((e) => GetBandEventsEventsEventMembersOnEvent.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandEventsEvents otherTyped = other as GetBandEventsEvents;
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
    eventMembers_on_event == otherTyped.eventMembers_on_event;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, imageUrl.hashCode, startDate.hashCode, endDate.hashCode, status.hashCode, freeEntry.hashCode, entryCondition.hashCode, updatedAt.hashCode, createdAt.hashCode, eventMembers_on_event.hashCode]);
  

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
    json['eventMembers_on_event'] = eventMembers_on_event.map((e) => e.toJson()).toList();
    return json;
  }

  GetBandEventsEvents({
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
    required this.eventMembers_on_event,
  });
}

@immutable
class GetBandEventsEventsEventMembersOnEvent {
  final String status;
  final GetBandEventsEventsEventMembersOnEventMember member;
  GetBandEventsEventsEventMembersOnEvent.fromJson(dynamic json):
  
  status = nativeFromJson<String>(json['status']),
  member = GetBandEventsEventsEventMembersOnEventMember.fromJson(json['member']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandEventsEventsEventMembersOnEvent otherTyped = other as GetBandEventsEventsEventMembersOnEvent;
    return status == otherTyped.status && 
    member == otherTyped.member;
    
  }
  @override
  int get hashCode => Object.hashAll([status.hashCode, member.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['status'] = nativeToJson<String>(status);
    json['member'] = member.toJson();
    return json;
  }

  GetBandEventsEventsEventMembersOnEvent({
    required this.status,
    required this.member,
  });
}

@immutable
class GetBandEventsEventsEventMembersOnEventMember {
  final String id;
  GetBandEventsEventsEventMembersOnEventMember.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandEventsEventsEventMembersOnEventMember otherTyped = other as GetBandEventsEventsEventMembersOnEventMember;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetBandEventsEventsEventMembersOnEventMember({
    required this.id,
  });
}

@immutable
class GetBandEventsData {
  final List<GetBandEventsEvents> events;
  GetBandEventsData.fromJson(dynamic json):
  
  events = (json['events'] as List<dynamic>)
        .map((e) => GetBandEventsEvents.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandEventsData otherTyped = other as GetBandEventsData;
    return events == otherTyped.events;
    
  }
  @override
  int get hashCode => events.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['events'] = events.map((e) => e.toJson()).toList();
    return json;
  }

  GetBandEventsData({
    required this.events,
  });
}

@immutable
class GetBandEventsVariables {
  final String bandId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetBandEventsVariables.fromJson(Map<String, dynamic> json):
  
  bandId = nativeFromJson<String>(json['bandId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetBandEventsVariables otherTyped = other as GetBandEventsVariables;
    return bandId == otherTyped.bandId;
    
  }
  @override
  int get hashCode => bandId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['bandId'] = nativeToJson<String>(bandId);
    return json;
  }

  GetBandEventsVariables({
    required this.bandId,
  });
}

