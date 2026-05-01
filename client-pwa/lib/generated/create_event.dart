part of 'samby.dart';

class CreateEventVariablesBuilder {
  String associationId;
  String title;
  String description;
  String imageUrl;
  Optional<Timestamp> _startDate = Optional.optional((json) => json['startDate'] = Timestamp.fromJson(json['startDate']), defaultSerializer);
  Optional<Timestamp> _endDate = Optional.optional((json) => json['endDate'] = Timestamp.fromJson(json['endDate']), defaultSerializer);
  bool freeEntry;
  Optional<String> _entryCondition = Optional.optional(nativeFromJson, nativeToJson);
  String createdBy;

  final FirebaseDataConnect _dataConnect;  CreateEventVariablesBuilder startDate(Timestamp? t) {
   _startDate.value = t;
   return this;
  }
  CreateEventVariablesBuilder endDate(Timestamp? t) {
   _endDate.value = t;
   return this;
  }
  CreateEventVariablesBuilder entryCondition(String? t) {
   _entryCondition.value = t;
   return this;
  }

  CreateEventVariablesBuilder(this._dataConnect, {required  this.associationId,required  this.title,required  this.description,required  this.imageUrl,required  this.freeEntry,required  this.createdBy,});
  Deserializer<CreateEventData> dataDeserializer = (dynamic json)  => CreateEventData.fromJson(jsonDecode(json));
  Serializer<CreateEventVariables> varsSerializer = (CreateEventVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateEventData, CreateEventVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateEventData, CreateEventVariables> ref() {
    CreateEventVariables vars= CreateEventVariables(associationId: associationId,title: title,description: description,imageUrl: imageUrl,startDate: _startDate,endDate: _endDate,freeEntry: freeEntry,entryCondition: _entryCondition,createdBy: createdBy,);
    return _dataConnect.mutation("CreateEvent", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateEventEventInsert {
  final String id;
  CreateEventEventInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventEventInsert otherTyped = other as CreateEventEventInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateEventEventInsert({
    required this.id,
  });
}

@immutable
class CreateEventData {
  final CreateEventEventInsert event_insert;
  CreateEventData.fromJson(dynamic json):
  
  event_insert = CreateEventEventInsert.fromJson(json['event_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventData otherTyped = other as CreateEventData;
    return event_insert == otherTyped.event_insert;
    
  }
  @override
  int get hashCode => event_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['event_insert'] = event_insert.toJson();
    return json;
  }

  CreateEventData({
    required this.event_insert,
  });
}

@immutable
class CreateEventVariables {
  final String associationId;
  final String title;
  final String description;
  final String imageUrl;
  late final Optional<Timestamp>startDate;
  late final Optional<Timestamp>endDate;
  final bool freeEntry;
  late final Optional<String>entryCondition;
  final String createdBy;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateEventVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  imageUrl = nativeFromJson<String>(json['imageUrl']),
  freeEntry = nativeFromJson<bool>(json['freeEntry']),
  createdBy = nativeFromJson<String>(json['createdBy']) {
  
  
  
  
  
  
    startDate = Optional.optional((json) => json['startDate'] = Timestamp.fromJson(json['startDate']), defaultSerializer);
    startDate.value = json['startDate'] == null ? null : Timestamp.fromJson(json['startDate']);
  
  
    endDate = Optional.optional((json) => json['endDate'] = Timestamp.fromJson(json['endDate']), defaultSerializer);
    endDate.value = json['endDate'] == null ? null : Timestamp.fromJson(json['endDate']);
  
  
  
    entryCondition = Optional.optional(nativeFromJson, nativeToJson);
    entryCondition.value = json['entryCondition'] == null ? null : nativeFromJson<String>(json['entryCondition']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateEventVariables otherTyped = other as CreateEventVariables;
    return associationId == otherTyped.associationId && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    imageUrl == otherTyped.imageUrl && 
    startDate == otherTyped.startDate && 
    endDate == otherTyped.endDate && 
    freeEntry == otherTyped.freeEntry && 
    entryCondition == otherTyped.entryCondition && 
    createdBy == otherTyped.createdBy;
    
  }
  @override
  int get hashCode => Object.hashAll([associationId.hashCode, title.hashCode, description.hashCode, imageUrl.hashCode, startDate.hashCode, endDate.hashCode, freeEntry.hashCode, entryCondition.hashCode, createdBy.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    if(startDate.state == OptionalState.set) {
      json['startDate'] = startDate.toJson();
    }
    if(endDate.state == OptionalState.set) {
      json['endDate'] = endDate.toJson();
    }
    json['freeEntry'] = nativeToJson<bool>(freeEntry);
    if(entryCondition.state == OptionalState.set) {
      json['entryCondition'] = entryCondition.toJson();
    }
    json['createdBy'] = nativeToJson<String>(createdBy);
    return json;
  }

  CreateEventVariables({
    required this.associationId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.freeEntry,
    required this.entryCondition,
    required this.createdBy,
  });
}

