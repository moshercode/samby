import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/membership.dart';

abstract class MemberRepository {
  void getMember(
    String memberId, {
    required Function(Member? member, AppError? error) onComplete,
  });

  void getAssociationMembers(
    String associationId, {
    required Function(List<Member> members, AppError? error) onComplete,
  });

  void updateMemberApplication({
    required String memberId,
    required String memberName,
    required String memberBirthDate,
    required String memberDni,
    required String memberDniImageUrl,
    String? guardianName,
    String? guardianDni,
    String? guardianDniImageUrl,
    required String signatureUrl,
    required String conditionsAcceptedAt,
    String? minorConditionsAcceptedAt,
    required String requestedAt,
    required Function(AppError? error) onComplete,
  });

  void resetMemberApplication({
    required String memberId,
    required String memberName,
    required String memberBirthDate,
    required String memberDni,
    required String memberDniImageUrl,
    String? guardianName,
    String? guardianDni,
    String? guardianDniImageUrl,
    required String signatureUrl,
    required String conditionsAcceptedAt,
    String? minorConditionsAcceptedAt,
    required String requestedAt,
    required Function(AppError? error) onComplete,
  });

  void updateMemberStatus(
    String memberId,
    String status,
    String resolvedBy,
    String resolvedAt, {
    required Function(AppError? error) onComplete,
  });

  void updateMemberRole(
    String memberId,
    String role, {
    required Function(AppError? error) onComplete,
  });

  void updateMemberBlock(
    String memberId,
    bool isBlocked, {
    required Function(AppError? error) onComplete,
  });

  void updateMemberNotes(
    String memberId,
    String internalNotes, {
    required Function(AppError? error) onComplete,
  });

  void createFounderMember(
    String associationId,
    String name,
    String email, {
    required Function(AppError? error) onComplete,
  });

  void updateMemberFcmToken(
    String memberId,
    String token, {
    required Function(AppError? error) onComplete,
  });
}

typedef MembershipRepository = MemberRepository;
