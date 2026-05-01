part of 'samby.dart';

class UpdateMemberNotesVariablesBuilder {
  String id;
  String internalNotes;

  final FirebaseDataConnect _dataConnect;
  UpdateMemberNotesVariablesBuilder(this._dataConnect, {required  this.id,required  this.internalNotes,});
  Deserializer<UpdateMemberNotesData> dataDeserializer = (dynamic json)  => UpdateMemberNotesData.fromJson(jsonDecode(json));
  Serializer<UpdateMemberNotesVariables> varsSerializer = (UpdateMemberNotesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMemberNotesData, UpdateMemberNotesVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMemberNotesData, UpdateMemberNotesVariables> ref() {
    UpdateMemberNotesVariables vars= UpdateMemberNotesVariables(id: id,internalNotes: internalNotes,);
    return _dataConnect.mutation("UpdateMemberNotes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateMemberNotesMemberUpdate {
  final String id;
  UpdateMemberNotesMemberUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberNotesMemberUpdate otherTyped = other as UpdateMemberNotesMemberUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMemberNotesMemberUpdate({
    required this.id,
  });
}

@immutable
class UpdateMemberNotesData {
  final UpdateMemberNotesMemberUpdate? member_update;
  UpdateMemberNotesData.fromJson(dynamic json):
  
  member_update = json['member_update'] == null ? null : UpdateMemberNotesMemberUpdate.fromJson(json['member_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberNotesData otherTyped = other as UpdateMemberNotesData;
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

  UpdateMemberNotesData({
    this.member_update,
  });
}

@immutable
class UpdateMemberNotesVariables {
  final String id;
  final String internalNotes;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMemberNotesVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  internalNotes = nativeFromJson<String>(json['internalNotes']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateMemberNotesVariables otherTyped = other as UpdateMemberNotesVariables;
    return id == otherTyped.id && 
    internalNotes == otherTyped.internalNotes;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, internalNotes.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['internalNotes'] = nativeToJson<String>(internalNotes);
    return json;
  }

  UpdateMemberNotesVariables({
    required this.id,
    required this.internalNotes,
  });
}

