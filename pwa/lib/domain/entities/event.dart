import 'package:samby/domain/entities/entity.dart';

class Event implements Entity {
  // Variables

  late String id;
  late String associationId;
  late String title;
  late String description;
  late DateTime eventDate;
  DateTime? endDate;
  late String createdByUserId;
  late String createdByName;
  late DateTime createdAt;
  late List<String> imageUrls;

  // Constructor

  @override
  Event.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    associationId = map['associationId'] as String;
    title = map['title'] as String;
    description = map['description'] as String;
    eventDate = DateTime.parse(map['eventDate'] as String);
    final String? endDateStr = map['endDate'] as String?;
    endDate = endDateStr != null ? DateTime.parse(endDateStr) : null;
    createdByUserId = (map['createdBy'] as Map<String, dynamic>)['id'] as String;
    createdByName = (map['createdBy'] as Map<String, dynamic>)['name'] as String;
    createdAt = DateTime.parse(map['createdAt'] as String);
    final List<dynamic> images = map['eventImages'] as List<dynamic>? ?? <dynamic>[];
    imageUrls = images
        .map((dynamic img) => (img as Map<String, dynamic>)['imageUrl'] as String)
        .toList();
  }
}
