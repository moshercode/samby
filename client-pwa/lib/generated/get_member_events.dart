part of 'samby.dart';

class GetMemberEventsVariablesBuilder {
  String memberId;

  final FirebaseDataConnect _dataConnect;
  GetMemberEventsVariablesBuilder(this._dataConnect, {required  this.memberId,});
  Deserializer<GetMemberEventsData> dataDeserializer = (dynamic json)  => GetMemberEventsData.fromJson(jsonDecode(json));
  Serializer<GetMemberEventsVariables> varsSerializer = (GetMemberEventsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetMemberEventsData, GetMemberEventsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetMemberEventsData, GetMemberEventsVariables> ref() {
    GetMemberEventsVariables vars= GetMemberEventsVariables(memberId: memberId,);
    return _dataConnect.query("GetMemberEvents", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetMemberEventsEventMembers {
  final GetMemberEventsEventMembersEvent event;
  GetMemberEventsEventMembers.fromJson(dynamic json):
  
  event = GetMemberEventsEventMembersEvent.fromJson(json['event']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberEventsEventMembers otherTyped = other as GetMemberEventsEventMembers;
    return event == otherTyped.event;
    
  }
  @override
  int get hashCode => event.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['event'] = event.toJson();
    return json;
  }

  GetMemberEventsEventMembers({
    required this.event,
  });
}

@immutable
class GetMemberEventsEventMembersEvent {
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
  GetMemberEventsEventMembersEvent.fromJson(dynamic json):
  
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
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberEventsEventMembersEvent otherTyped = other as GetMemberEventsEventMembersEvent;
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
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, imageUrl.hashCode, startDate.hashCode, endDate.hashCode, status.hashCode, freeEntry.hashCode, entryCondition.hashCode, updatedAt.hashCode, createdAt.hashCode]);
  

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
    return json;
  }

  GetMemberEventsEventMembersEvent({
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
  });
}

@immutable
class GetMemberEventsData {
  final List<GetMemberEventsEventMembers> eventMembers;
  GetMemberEventsData.fromJson(dynamic json):
  
  eventMembers = (json['eventMembers'] as List<dynamic>)
        .map((e) => GetMemberEventsEventMembers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberEventsData otherTyped = other as GetMemberEventsData;
    return eventMembers == otherTyped.eventMembers;
    
  }
  @override
  int get hashCode => eventMembers.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventMembers'] = eventMembers.map((e) => e.toJson()).toList();
    return json;
  }

  GetMemberEventsData({
    required this.eventMembers,
  });
}

@immutable
class GetMemberEventsVariables {
  final String memberId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetMemberEventsVariables.fromJson(Map<String, dynamic> json):
  
  memberId = nativeFromJson<String>(json['memberId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMemberEventsVariables otherTyped = other as GetMemberEventsVariables;
    return memberId == otherTyped.memberId;
    
  }
  @override
  int get hashCode => memberId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['memberId'] = nativeToJson<String>(memberId);
    return json;
  }

  GetMemberEventsVariables({
    required this.memberId,
  });
}

