import 'package:samby/domain/entities/entity.dart';

class EventAccessRequest implements Entity {
  late String id;
  late String status;
  late DateTime requestedAt;
  DateTime? resolvedAt;

  bool get isPending => status == 'pending';
  bool get isApproved => status == 'approved';
  bool get isRejected => status == 'rejected';

  @override
  EventAccessRequest.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    status = map['status'] as String;
    requestedAt = DateTime.parse(map['requestedAt'] as String);
    final String? resolvedStr = map['resolvedAt'] as String?;
    resolvedAt = resolvedStr != null ? DateTime.parse(resolvedStr) : null;
  }
}
