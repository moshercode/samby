part of 'samby.dart';

class GetAssociationEventsVariablesBuilder {
  String associationId;

  final FirebaseDataConnect _dataConnect;
  GetAssociationEventsVariablesBuilder(this._dataConnect, {required  this.associationId,});
  Deserializer<GetAssociationEventsData> dataDeserializer = (dynamic json)  => GetAssociationEventsData.fromJson(jsonDecode(json));
  Serializer<GetAssociationEventsVariables> varsSerializer = (GetAssociationEventsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAssociationEventsData, GetAssociationEventsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetAssociationEventsData, GetAssociationEventsVariables> ref() {
    GetAssociationEventsVariables vars= GetAssociationEventsVariables(associationId: associationId,);
    return _dataConnect.query("GetAssociationEvents", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetAssociationEventsEvents {
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
  final List<GetAssociationEventsEventsEventMembersOnEvent> eventMembers_on_event;
  GetAssociationEventsEvents.fromJson(dynamic json):
  
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
        .map((e) => GetAssociationEventsEventsEventMembersOnEvent.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationEventsEvents otherTyped = other as GetAssociationEventsEvents;
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

  GetAssociationEventsEvents({
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
class GetAssociationEventsEventsEventMembersOnEvent {
  final String status;
  final GetAssociationEventsEventsEventMembersOnEventMember member;
  GetAssociationEventsEventsEventMembersOnEvent.fromJson(dynamic json):
  
  status = nativeFromJson<String>(json['status']),
  member = GetAssociationEventsEventsEventMembersOnEventMember.fromJson(json['member']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationEventsEventsEventMembersOnEvent otherTyped = other as GetAssociationEventsEventsEventMembersOnEvent;
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

  GetAssociationEventsEventsEventMembersOnEvent({
    required this.status,
    required this.member,
  });
}

@immutable
class GetAssociationEventsEventsEventMembersOnEventMember {
  final String id;
  GetAssociationEventsEventsEventMembersOnEventMember.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationEventsEventsEventMembersOnEventMember otherTyped = other as GetAssociationEventsEventsEventMembersOnEventMember;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetAssociationEventsEventsEventMembersOnEventMember({
    required this.id,
  });
}

@immutable
class GetAssociationEventsData {
  final List<GetAssociationEventsEvents> events;
  GetAssociationEventsData.fromJson(dynamic json):
  
  events = (json['events'] as List<dynamic>)
        .map((e) => GetAssociationEventsEvents.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationEventsData otherTyped = other as GetAssociationEventsData;
    return events == otherTyped.events;
    
  }
  @override
  int get hashCode => events.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['events'] = events.map((e) => e.toJson()).toList();
    return json;
  }

  GetAssociationEventsData({
    required this.events,
  });
}

@immutable
class GetAssociationEventsVariables {
  final String associationId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetAssociationEventsVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAssociationEventsVariables otherTyped = other as GetAssociationEventsVariables;
    return associationId == otherTyped.associationId;
    
  }
  @override
  int get hashCode => associationId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    return json;
  }

  GetAssociationEventsVariables({
    required this.associationId,
  });
}

