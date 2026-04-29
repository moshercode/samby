import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/app_user.dart';
import 'package:samby/domain/entities/membership.dart';

abstract class MembershipRepository {
  void getMembership(
    String associationId,
    String userId, {
    required Function(Membership? membership, AppError? error) onComplete,
  });

  void getManagerMemberships(
    String userId, {
    required Function(List<Membership> memberships, AppError? error) onComplete,
  });

  void getUserByEmail(
    String email, {
    required Function(AppUser? user, AppError? error) onComplete,
  });

  void createAppUser(
    String email,
    String name,
    String phone, {
    required Function(String? userId, AppError? error) onComplete,
  });

  void createMembership({
    required String associationId,
    required String userId,
    required String memberName,
    required String memberBirthDate,
    required String memberDNI,
    required String memberDNIImageUrl,
    String? guardianName,
    String? guardianDNI,
    String? guardianDNIImageUrl,
    required String signatureUrl,
    required String conditionsAcceptedAt,
    String? minorConditionsAcceptedAt,
    required Function(AppError? error) onComplete,
  });

  void createFounderMembership(
    String associationId,
    String userId,
    String userName, {
    required Function(AppError? error) onComplete,
  });
}
