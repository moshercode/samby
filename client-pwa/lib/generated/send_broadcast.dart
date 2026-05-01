part of 'samby.dart';

class SendBroadcastVariablesBuilder {
  String associationId;
  String sentBy;
  String title;
  String body;

  final FirebaseDataConnect _dataConnect;
  SendBroadcastVariablesBuilder(this._dataConnect, {required  this.associationId,required  this.sentBy,required  this.title,required  this.body,});
  Deserializer<SendBroadcastData> dataDeserializer = (dynamic json)  => SendBroadcastData.fromJson(jsonDecode(json));
  Serializer<SendBroadcastVariables> varsSerializer = (SendBroadcastVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SendBroadcastData, SendBroadcastVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SendBroadcastData, SendBroadcastVariables> ref() {
    SendBroadcastVariables vars= SendBroadcastVariables(associationId: associationId,sentBy: sentBy,title: title,body: body,);
    return _dataConnect.mutation("SendBroadcast", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SendBroadcastBroadcastMessageInsert {
  final String id;
  SendBroadcastBroadcastMessageInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SendBroadcastBroadcastMessageInsert otherTyped = other as SendBroadcastBroadcastMessageInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  SendBroadcastBroadcastMessageInsert({
    required this.id,
  });
}

@immutable
class SendBroadcastData {
  final SendBroadcastBroadcastMessageInsert broadcastMessage_insert;
  SendBroadcastData.fromJson(dynamic json):
  
  broadcastMessage_insert = SendBroadcastBroadcastMessageInsert.fromJson(json['broadcastMessage_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SendBroadcastData otherTyped = other as SendBroadcastData;
    return broadcastMessage_insert == otherTyped.broadcastMessage_insert;
    
  }
  @override
  int get hashCode => broadcastMessage_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['broadcastMessage_insert'] = broadcastMessage_insert.toJson();
    return json;
  }

  SendBroadcastData({
    required this.broadcastMessage_insert,
  });
}

@immutable
class SendBroadcastVariables {
  final String associationId;
  final String sentBy;
  final String title;
  final String body;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SendBroadcastVariables.fromJson(Map<String, dynamic> json):
  
  associationId = nativeFromJson<String>(json['associationId']),
  sentBy = nativeFromJson<String>(json['sentBy']),
  title = nativeFromJson<String>(json['title']),
  body = nativeFromJson<String>(json['body']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SendBroadcastVariables otherTyped = other as SendBroadcastVariables;
    return associationId == otherTyped.associationId && 
    sentBy == otherTyped.sentBy && 
    title == otherTyped.title && 
    body == otherTyped.body;
    
  }
  @override
  int get hashCode => Object.hashAll([associationId.hashCode, sentBy.hashCode, title.hashCode, body.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['associationId'] = nativeToJson<String>(associationId);
    json['sentBy'] = nativeToJson<String>(sentBy);
    json['title'] = nativeToJson<String>(title);
    json['body'] = nativeToJson<String>(body);
    return json;
  }

  SendBroadcastVariables({
    required this.associationId,
    required this.sentBy,
    required this.title,
    required this.body,
  });
}

