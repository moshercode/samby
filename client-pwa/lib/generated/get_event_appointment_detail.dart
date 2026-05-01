part of 'samby.dart';

class GetEventAppointmentDetailVariablesBuilder {
  String appointmentId;

  final FirebaseDataConnect _dataConnect;
  GetEventAppointmentDetailVariablesBuilder(this._dataConnect, {required  this.appointmentId,});
  Deserializer<GetEventAppointmentDetailData> dataDeserializer = (dynamic json)  => GetEventAppointmentDetailData.fromJson(jsonDecode(json));
  Serializer<GetEventAppointmentDetailVariables> varsSerializer = (GetEventAppointmentDetailVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetEventAppointmentDetailData, GetEventAppointmentDetailVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetEventAppointmentDetailData, GetEventAppointmentDetailVariables> ref() {
    GetEventAppointmentDetailVariables vars= GetEventAppointmentDetailVariables(appointmentId: appointmentId,);
    return _dataConnect.query("GetEventAppointmentDetail", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetEventAppointmentDetailEventAppointment {
  final String id;
  final GetEventAppointmentDetailEventAppointmentEvent event;
  final String title;
  final String description;
  final Timestamp eventDate;
  final Timestamp? endDate;
  final Timestamp createdAt;
  final List<GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment> eventAppointmentComments_on_eventAppointment;
  GetEventAppointmentDetailEventAppointment.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  event = GetEventAppointmentDetailEventAppointmentEvent.fromJson(json['event']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  eventDate = Timestamp.fromJson(json['eventDate']),
  endDate = json['endDate'] == null ? null : Timestamp.fromJson(json['endDate']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  eventAppointmentComments_on_eventAppointment = (json['eventAppointmentComments_on_eventAppointment'] as List<dynamic>)
        .map((e) => GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailEventAppointment otherTyped = other as GetEventAppointmentDetailEventAppointment;
    return id == otherTyped.id && 
    event == otherTyped.event && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    eventDate == otherTyped.eventDate && 
    endDate == otherTyped.endDate && 
    createdAt == otherTyped.createdAt && 
    eventAppointmentComments_on_eventAppointment == otherTyped.eventAppointmentComments_on_eventAppointment;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, event.hashCode, title.hashCode, description.hashCode, eventDate.hashCode, endDate.hashCode, createdAt.hashCode, eventAppointmentComments_on_eventAppointment.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['event'] = event.toJson();
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['eventDate'] = eventDate.toJson();
    if (endDate != null) {
      json['endDate'] = endDate!.toJson();
    }
    json['createdAt'] = createdAt.toJson();
    json['eventAppointmentComments_on_eventAppointment'] = eventAppointmentComments_on_eventAppointment.map((e) => e.toJson()).toList();
    return json;
  }

  GetEventAppointmentDetailEventAppointment({
    required this.id,
    required this.event,
    required this.title,
    required this.description,
    required this.eventDate,
    this.endDate,
    required this.createdAt,
    required this.eventAppointmentComments_on_eventAppointment,
  });
}

@immutable
class GetEventAppointmentDetailEventAppointmentEvent {
  final String id;
  final String title;
  GetEventAppointmentDetailEventAppointmentEvent.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailEventAppointmentEvent otherTyped = other as GetEventAppointmentDetailEventAppointmentEvent;
    return id == otherTyped.id && 
    title == otherTyped.title;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    return json;
  }

  GetEventAppointmentDetailEventAppointmentEvent({
    required this.id,
    required this.title,
  });
}

@immutable
class GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment {
  final String id;
  final GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor author;
  final String content;
  final String? imageUrls;
  final GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment? parentComment;
  final Timestamp createdAt;
  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  author = GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor.fromJson(json['author']),
  content = nativeFromJson<String>(json['content']),
  imageUrls = json['imageUrls'] == null ? null : nativeFromJson<String>(json['imageUrls']),
  parentComment = json['parentComment'] == null ? null : GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment.fromJson(json['parentComment']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment otherTyped = other as GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment;
    return id == otherTyped.id && 
    author == otherTyped.author && 
    content == otherTyped.content && 
    imageUrls == otherTyped.imageUrls && 
    parentComment == otherTyped.parentComment && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, author.hashCode, content.hashCode, imageUrls.hashCode, parentComment.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['author'] = author.toJson();
    json['content'] = nativeToJson<String>(content);
    if (imageUrls != null) {
      json['imageUrls'] = nativeToJson<String?>(imageUrls);
    }
    if (parentComment != null) {
      json['parentComment'] = parentComment!.toJson();
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointment({
    required this.id,
    required this.author,
    required this.content,
    this.imageUrls,
    this.parentComment,
    required this.createdAt,
  });
}

@immutable
class GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor {
  final String id;
  final String? name;
  final String? profileImageUrl;
  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = json['name'] == null ? null : nativeFromJson<String>(json['name']),
  profileImageUrl = json['profileImageUrl'] == null ? null : nativeFromJson<String>(json['profileImageUrl']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor otherTyped = other as GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    profileImageUrl == otherTyped.profileImageUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, profileImageUrl.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if (name != null) {
      json['name'] = nativeToJson<String?>(name);
    }
    if (profileImageUrl != null) {
      json['profileImageUrl'] = nativeToJson<String?>(profileImageUrl);
    }
    return json;
  }

  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentAuthor({
    required this.id,
    this.name,
    this.profileImageUrl,
  });
}

@immutable
class GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment {
  final String id;
  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment otherTyped = other as GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetEventAppointmentDetailEventAppointmentEventAppointmentCommentsOnEventAppointmentParentComment({
    required this.id,
  });
}

@immutable
class GetEventAppointmentDetailData {
  final GetEventAppointmentDetailEventAppointment? eventAppointment;
  GetEventAppointmentDetailData.fromJson(dynamic json):
  
  eventAppointment = json['eventAppointment'] == null ? null : GetEventAppointmentDetailEventAppointment.fromJson(json['eventAppointment']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailData otherTyped = other as GetEventAppointmentDetailData;
    return eventAppointment == otherTyped.eventAppointment;
    
  }
  @override
  int get hashCode => eventAppointment.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (eventAppointment != null) {
      json['eventAppointment'] = eventAppointment!.toJson();
    }
    return json;
  }

  GetEventAppointmentDetailData({
    this.eventAppointment,
  });
}

@immutable
class GetEventAppointmentDetailVariables {
  final String appointmentId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetEventAppointmentDetailVariables.fromJson(Map<String, dynamic> json):
  
  appointmentId = nativeFromJson<String>(json['appointmentId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEventAppointmentDetailVariables otherTyped = other as GetEventAppointmentDetailVariables;
    return appointmentId == otherTyped.appointmentId;
    
  }
  @override
  int get hashCode => appointmentId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['appointmentId'] = nativeToJson<String>(appointmentId);
    return json;
  }

  GetEventAppointmentDetailVariables({
    required this.appointmentId,
  });
}

