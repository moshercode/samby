import 'package:samby/domain/entities/entity.dart';

class EventComment implements Entity {
  // Variables

  late String id;
  late String eventId;
  late String userId;
  late String userName;
  late String content;
  late DateTime createdAt;

  // Constructor

  @override
  EventComment.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    eventId = map['eventId'] as String;
    userId = (map['user'] as Map<String, dynamic>)['id'] as String;
    userName = (map['user'] as Map<String, dynamic>)['name'] as String;
    content = map['content'] as String;
    createdAt = DateTime.parse(map['createdAt'] as String);
  }
}
