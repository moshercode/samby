import 'package:samby/domain/entities/entity.dart';

class CalendarEvent implements Entity {
  late String id;
  late String title;
  late String description;
  late DateTime eventDate;
  DateTime? endDate;
  late DateTime createdAt;

  @override
  CalendarEvent.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    title = map['title'] as String;
    description = map['description'] as String;
    eventDate = DateTime.parse(map['eventDate'] as String);
    final String? endStr = map['endDate'] as String?;
    endDate = endStr != null ? DateTime.parse(endStr) : null;
    createdAt = DateTime.parse(map['createdAt'] as String? ?? DateTime.now().toUtc().toIso8601String());
  }
}
