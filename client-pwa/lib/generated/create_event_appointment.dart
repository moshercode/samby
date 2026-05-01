part of 'samby.dart';

class CreateEventAppointmentVariablesBuilder {
  String eventId;
  String title;
  String description;
  Timestamp eventDate;
  Optional<Timestamp> _endDate = Optional.optional((json) => json['endDate'] = Timestamp.fromJson(json['endDate']), defaultSerializer);
  String createdBy;

  final FirebaseDataConnect _dataConnect;  CreateEventAppointmentVariablesBuilder endDate(Timestamp? t) {
   _endDate.value = t;
   return this;
  }

  CreateEventAppointmentVariablesBuilder(this._dataConnect, {required  this.eventId,required  this.title,required  this.description,required  this.eventDate,required  this.createdBy,});
  Deserializer<CreateEventAppointmentData> dataDeserializer = (dynamic json)  => CreateEventAppointmentData.fromJson(jsonDecode(json));
  Serializer<CreateEventAppointmentVariables> varsSerializer = (CreateEventAppointmentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateEventAppointmentData, CreateEventAppointmentVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateEventAppointmentData, CreateEventAppointmentVariables> ref() {
    CreateEventAppointmentVariables vars= CreateEventAppointmentVariables(eventId: eventId,title: title,description: description,eventDate: eventDate,endDate: _endDate,createdBy: createdBy,);
    return _dataConnect.mutation("CreateEventAppointment", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateEventAppointmentEventAppointmentInsert {
  final String id;
  CreateEventAppointmentEventAppointmentInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventAppointmentEventAppointmentInsert otherTyped = other as CreateEventAppointmentEventAppointmentInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateEventAppointmentEventAppointmentInsert({
    required this.id,
  });
}

@immutable
class CreateEventAppointmentData {
  final CreateEventAppointmentEventAppointmentInsert eventAppointment_insert;
  CreateEventAppointmentData.fromJson(dynamic json):
  
  eventAppointment_insert = CreateEventAppointmentEventAppointmentInsert.fromJson(json['eventAppointment_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventAppointmentData otherTyped = other as CreateEventAppointmentData;
    return eventAppointment_insert == otherTyped.eventAppointment_insert;
    
  }
  @override
  int get hashCode => eventAppointment_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventAppointment_insert'] = eventAppointment_insert.toJson();
    return json;
  }

  CreateEventAppointmentData({
    required this.eventAppointment_insert,
  });
}

@immutable
class CreateEventAppointmentVariables {
  final String eventId;
  final String title;
  final String description;
  final Timestamp eventDate;
  late final Optional<Timestamp>endDate;
  final String createdBy;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateEventAppointmentVariables.fromJson(Map<String, dynamic> json):
  
  eventId = nativeFromJson<String>(json['eventId']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  eventDate = Timestamp.fromJson(json['eventDate']),
  createdBy = nativeFromJson<String>(json['createdBy']) {
  
  
  
  
  
  
    endDate = Optional.optional((json) => json['endDate'] = Timestamp.fromJson(json['endDate']), defaultSerializer);
    endDate.value = json['endDate'] == null ? null : Timestamp.fromJson(json['endDate']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventAppointmentVariables otherTyped = other as CreateEventAppointmentVariables;
    return eventId == otherTyped.eventId && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    eventDate == otherTyped.eventDate && 
    endDate == otherTyped.endDate && 
    createdBy == otherTyped.createdBy;
    
  }
  @override
  int get hashCode => Object.hashAll([eventId.hashCode, title.hashCode, description.hashCode, eventDate.hashCode, endDate.hashCode, createdBy.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventId'] = nativeToJson<String>(eventId);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['eventDate'] = eventDate.toJson();
    if(endDate.state == OptionalState.set) {
      json['endDate'] = endDate.toJson();
    }
    json['createdBy'] = nativeToJson<String>(createdBy);
    return json;
  }

  CreateEventAppointmentVariables({
    required this.eventId,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.endDate,
    required this.createdBy,
  });
}

