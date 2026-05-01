import 'package:samby/domain/entities/entity.dart';
import 'package:samby/domain/entities/event_appointment.dart';

enum EventStatus { active, finished, cancelled }

class Event implements Entity {
  // Variables

  late String id;
  late String associationId;
  late String title;
  late String description;
  late String imageUrl;
  DateTime? startDate;
  DateTime? endDate;
  late EventStatus status;
  late bool freeEntry;
  String? entryCondition;
  DateTime? updatedAt;
  late DateTime createdAt;
  late List<String> memberIds;
  late List<String> memberNames;
  late List<EventAppointment> appointments;

  bool get isActive => status == EventStatus.active;
  bool get isFinished => status == EventStatus.finished;
  bool get isCancelled => status == EventStatus.cancelled;

  bool get isUpcoming => startDate != null && startDate!.isAfter(DateTime.now());

  // Constructor

  @override
  Event.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    associationId = (map['association'] as Map<String, dynamic>?)?['id'] as String? ?? map['associationId'] as String? ?? '';
    title = map['title'] as String;
    description = map['description'] as String;
    imageUrl = map['imageUrl'] as String? ?? '';
    final String? startStr = map['startDate'] as String?;
    startDate = startStr != null ? DateTime.parse(startStr) : null;
    final String? endStr = map['endDate'] as String?;
    endDate = endStr != null ? DateTime.parse(endStr) : null;
    final String? statusStr = (map['status'] as String?)?.toLowerCase();
    status = EventStatus.values.firstWhere((EventStatus s) => s.name == statusStr, orElse: () => EventStatus.active);
    freeEntry = map['freeEntry'] as bool? ?? true;
    entryCondition = map['entryCondition'] as String?;
    final String? updatedAtStr = map['updatedAt'] as String?;
    updatedAt = updatedAtStr != null ? DateTime.parse(updatedAtStr) : null;
    createdAt = DateTime.parse(map['createdAt'] as String? ?? DateTime.now().toUtc().toIso8601String());

    final List<dynamic> members = map['eventMembers_on_event'] as List<dynamic>? ?? <dynamic>[];
    final List<dynamic> approved = members.where((dynamic m) {
      final Map<String, dynamic> entry = m as Map<String, dynamic>;
      return entry['status'] == 'approved';
    }).toList();
    memberIds = approved.map((dynamic m) {
      final Map<String, dynamic> entry = m as Map<String, dynamic>;
      return (entry['member'] as Map<String, dynamic>)['id'] as String;
    }).toList();
    memberNames = approved.map((dynamic m) {
      final Map<String, dynamic> entry = m as Map<String, dynamic>;
      return (entry['member'] as Map<String, dynamic>)['name'] as String? ?? '';
    }).toList();

    final List<dynamic> appts = map['eventAppointments_on_event'] as List<dynamic>? ?? <dynamic>[];
    appointments = appts.map((dynamic e) => EventAppointment.fromMap(e as Map<String, dynamic>)).toList();
  }

  // Public methods

  bool hasAccessFor(String? memberId) {
    if (memberId == null) return false;
    return memberIds.contains(memberId);
  }
}
