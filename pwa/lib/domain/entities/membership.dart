import 'package:samby/domain/entities/entity.dart';

enum MembershipRole { manager, member }

enum MembershipStatus { pending, approved, rejected }

class Membership implements Entity {
  // Variables

  late String id;
  late String associationId;
  late String userId;
  late MembershipRole role;
  late MembershipStatus status;
  late bool isBlocked;
  late bool isFounder;
  late String memberName;
  late String memberDNI;
  String? guardianName;
  String? guardianDNI;
  String? internalNotes;

  // Getters

  bool get isManager => role == MembershipRole.manager;
  bool get isApproved => status == MembershipStatus.approved;
  bool get isPending => status == MembershipStatus.pending;
  bool get isRejected => status == MembershipStatus.rejected;
  bool get canReapply => isRejected && !isBlocked;

  // Constructor

  @override
  Membership.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    associationId = map['associationId'] as String;
    userId = map['userId'] as String;
    role = MembershipRole.values.firstWhere(
      (MembershipRole r) => r.name == map['role'],
      orElse: () => MembershipRole.member,
    );
    status = MembershipStatus.values.firstWhere(
      (MembershipStatus s) => s.name == map['status'],
      orElse: () => MembershipStatus.pending,
    );
    isBlocked = map['isBlocked'] as bool? ?? false;
    isFounder = map['isFounder'] as bool? ?? false;
    memberName = map['memberName'] as String? ?? '';
    memberDNI = map['memberDNI'] as String? ?? '';
    guardianName = map['guardianName'] as String?;
    guardianDNI = map['guardianDNI'] as String?;
    internalNotes = map['internalNotes'] as String?;
  }
}
