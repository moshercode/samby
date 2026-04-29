import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/domain/entities/app_user.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';

class MembershipRepositoryImpl implements MembershipRepository {
  // Variables

  final DataconnectDatasource _datasource;

  // Constructor

  MembershipRepositoryImpl(this._datasource);

  // Public methods

  @override
  void getMembership(
    String associationId,
    String userId, {
    required Function(Membership? membership, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getMembership,
        variables: {
          DataconnectKeys.associationId: associationId,
          DataconnectKeys.userId: userId,
        },
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.associationMembership] as Map<String, dynamic>?;
      final Membership? membership = raw != null ? Membership.fromMap(raw) : null;
      onComplete(membership, null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.getMembership: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.getMembership unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void getManagerMemberships(
    String userId, {
    required Function(List<Membership> memberships, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getManagerMemberships,
        variables: {DataconnectKeys.userId: userId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.associationMemberships] as List<dynamic>? ?? <dynamic>[];
      final List<Membership> memberships =
          raw.map((dynamic m) => Membership.fromMap(m as Map<String, dynamic>)).toList();
      onComplete(memberships, null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.getManagerMemberships: $e');
      onComplete(<Membership>[], e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.getManagerMemberships unknown: $e');
      onComplete(<Membership>[], DataError(e.toString()));
    }
  }

  @override
  void getUserByEmail(
    String email, {
    required Function(AppUser? user, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getUserByEmail,
        variables: {DataconnectKeys.email: email},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.appUsers] as List<dynamic>? ?? <dynamic>[];
      final AppUser? user =
          raw.isNotEmpty ? AppUser.fromMap(raw.first as Map<String, dynamic>) : null;
      onComplete(user, null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.getUserByEmail: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.getUserByEmail unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void createAppUser(
    String email,
    String name,
    String phone, {
    required Function(String? userId, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeMutation(
        DataconnectOps.createAppUser,
        variables: {
          DataconnectKeys.email: email,
          DataconnectKeys.name: name,
          DataconnectKeys.phone: phone,
        },
      );
      final String? id = (data?['appUser_insert'] as Map<String, dynamic>?)?['id'] as String?;
      onComplete(id, null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.createAppUser: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.createAppUser unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.createMembership,
        variables: {
          DataconnectKeys.associationId: associationId,
          DataconnectKeys.userId: userId,
          DataconnectKeys.memberName: memberName,
          DataconnectKeys.memberBirthDate: memberBirthDate,
          DataconnectKeys.memberDNI: memberDNI,
          DataconnectKeys.memberDNIImageUrl: memberDNIImageUrl,
          if (guardianName != null) DataconnectKeys.guardianName: guardianName,
          if (guardianDNI != null) DataconnectKeys.guardianDNI: guardianDNI,
          if (guardianDNIImageUrl != null) DataconnectKeys.guardianDNIImageUrl: guardianDNIImageUrl,
          DataconnectKeys.signatureUrl: signatureUrl,
          DataconnectKeys.conditionsAcceptedAt: conditionsAcceptedAt,
          if (minorConditionsAcceptedAt != null)
            DataconnectKeys.minorConditionsAcceptedAt: minorConditionsAcceptedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.createMembership: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.createMembership unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void createFounderMembership(
    String associationId,
    String userId,
    String userName, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.createFounderMembership,
        variables: {
          DataconnectKeys.associationId: associationId,
          DataconnectKeys.userId: userId,
          DataconnectKeys.userName: userName,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MembershipRepositoryImpl.createFounderMembership: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MembershipRepositoryImpl.createFounderMembership unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }
}
