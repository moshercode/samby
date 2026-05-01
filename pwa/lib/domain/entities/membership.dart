import 'package:samby/domain/entities/entity.dart';

enum MemberRole { manager, member }

enum MemberStatus { pending, approved, rejected }

class Member implements Entity {
  // Variables

  late String id;
  late String associationId;
  late String email;
  late String phone;
  late MemberRole role;
  late MemberStatus status;
  late bool isBlocked;
  late bool isFounder;
  late String name;
  late String idDoc;
  String? idDocImageUrl;
  String? profileImageUrl;
  String? phone2;
  String? guardianName;
  String? guardianIdDoc;
  String? internalNotes;
  DateTime? requestedAt;

  // Getters

  bool get isManager => role == MemberRole.manager;
  bool get isApproved => status == MemberStatus.approved;
  bool get isPending => status == MemberStatus.pending;
  bool get isRejected => status == MemberStatus.rejected;
  bool get canReapply => isRejected && !isBlocked;

  // Constructor

  @override
  Member.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    final Map<String, dynamic>? assocMap = map['association'] as Map<String, dynamic>?;
    associationId = assocMap?['id'] as String? ?? map['associationId'] as String? ?? '';
    email = map['email'] as String? ?? '';
    phone = map['phone'] as String? ?? '';
    role = MemberRole.values.firstWhere(
      (MemberRole r) => r.name == (map['role'] as String?)?.toLowerCase(),
      orElse: () => MemberRole.member,
    );
    status = MemberStatus.values.firstWhere(
      (MemberStatus s) => s.name == (map['status'] as String?)?.toLowerCase(),
      orElse: () => MemberStatus.pending,
    );
    isBlocked = map['isBlocked'] as bool? ?? false;
    isFounder = map['isFounder'] as bool? ?? false;
    name = map['name'] as String? ?? '';
    idDoc = map['idDoc'] as String? ?? '';
    idDocImageUrl = map['idDocImageUrl'] as String?;
    profileImageUrl = map['profileImageUrl'] as String?;
    phone2 = map['phone2'] as String?;
    guardianName = map['guardianName'] as String?;
    guardianIdDoc = map['guardianIdDoc'] as String?;
    internalNotes = map['internalNotes'] as String?;
    final String? reqStr = map['requestedAt'] as String?;
    requestedAt = reqStr != null ? DateTime.tryParse(reqStr) : null;
  }
}

typedef Membership = Member;
typedef MembershipRole = MemberRole;
typedef MembershipStatus = MemberStatus;
