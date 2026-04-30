import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  // Variables

  final DataconnectDatasource _datasource;

  // Constructor

  MemberRepositoryImpl(this._datasource);

  // Public methods

  @override
  void getMember(
    String memberId, {
    required Function(Member? member, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getMember,
        variables: {DataconnectKeys.memberId: memberId},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.member] as Map<String, dynamic>?;
      final Member? member = raw != null ? Member.fromMap(raw) : null;
      onComplete(member, null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.getMember: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.getMember unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void getAssociationMembers(
    String associationId, {
    required Function(List<Member> members, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getAssociationMembers,
        variables: {DataconnectKeys.associationId: associationId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.members] as List<dynamic>? ?? <dynamic>[];
      final List<Member> members =
          raw.map((dynamic m) => Member.fromMap(m as Map<String, dynamic>)).toList();
      onComplete(members, null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.getAssociationMembers: $e');
      onComplete(<Member>[], e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.getAssociationMembers unknown: $e');
      onComplete(<Member>[], DataError(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberApplication,
        variables: {
          DataconnectKeys.id: memberId,
          DataconnectKeys.memberName: memberName,
          DataconnectKeys.memberBirthDate: memberBirthDate,
          DataconnectKeys.memberDni: memberDni,
          DataconnectKeys.memberDniImageUrl: memberDniImageUrl,
          if (guardianName != null) DataconnectKeys.guardianName: guardianName,
          if (guardianDni != null) DataconnectKeys.guardianDni: guardianDni,
          if (guardianDniImageUrl != null) DataconnectKeys.guardianDniImageUrl: guardianDniImageUrl,
          DataconnectKeys.signatureUrl: signatureUrl,
          DataconnectKeys.conditionsAcceptedAt: conditionsAcceptedAt,
          if (minorConditionsAcceptedAt != null)
            DataconnectKeys.minorConditionsAcceptedAt: minorConditionsAcceptedAt,
          DataconnectKeys.requestedAt: requestedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberApplication: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberApplication unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.resetMemberApplication,
        variables: {
          DataconnectKeys.id: memberId,
          DataconnectKeys.memberName: memberName,
          DataconnectKeys.memberBirthDate: memberBirthDate,
          DataconnectKeys.memberDni: memberDni,
          DataconnectKeys.memberDniImageUrl: memberDniImageUrl,
          if (guardianName != null) DataconnectKeys.guardianName: guardianName,
          if (guardianDni != null) DataconnectKeys.guardianDni: guardianDni,
          if (guardianDniImageUrl != null) DataconnectKeys.guardianDniImageUrl: guardianDniImageUrl,
          DataconnectKeys.signatureUrl: signatureUrl,
          DataconnectKeys.conditionsAcceptedAt: conditionsAcceptedAt,
          if (minorConditionsAcceptedAt != null)
            DataconnectKeys.minorConditionsAcceptedAt: minorConditionsAcceptedAt,
          DataconnectKeys.requestedAt: requestedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.resetMemberApplication: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.resetMemberApplication unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateMemberStatus(
    String memberId,
    String status,
    String resolvedBy,
    String resolvedAt, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberStatus,
        variables: {
          DataconnectKeys.id: memberId,
          DataconnectKeys.status: status,
          DataconnectKeys.resolvedBy: resolvedBy,
          DataconnectKeys.resolvedAt: resolvedAt,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberStatus: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberStatus unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateMemberRole(
    String memberId,
    String role, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberRole,
        variables: {DataconnectKeys.id: memberId, DataconnectKeys.role: role},
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberRole: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberRole unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateMemberBlock(
    String memberId,
    bool isBlocked, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberBlock,
        variables: {DataconnectKeys.id: memberId, DataconnectKeys.isBlocked: isBlocked},
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberBlock: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberBlock unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateMemberNotes(
    String memberId,
    String internalNotes, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberNotes,
        variables: {DataconnectKeys.id: memberId, DataconnectKeys.internalNotes: internalNotes},
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberNotes: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberNotes unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void createFounderMember(
    String associationId,
    String name,
    String email, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.createFounderMember,
        variables: {
          DataconnectKeys.associationId: associationId,
          DataconnectKeys.name: name,
          DataconnectKeys.email: email,
          DataconnectKeys.conditionsAcceptedAt: DateTime.now().toUtc().toIso8601String(),
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.createFounderMember: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.createFounderMember unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateMemberFcmToken(
    String memberId,
    String token, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateMemberFcmToken,
        variables: {
          DataconnectKeys.id: memberId,
          DataconnectKeys.token: token,
          DataconnectKeys.updatedAt: DateTime.now().toUtc().toIso8601String(),
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberFcmToken: $e');
      onComplete(e);
    } catch (e) {
      Log.error('MemberRepositoryImpl.updateMemberFcmToken unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }
}

typedef MembershipRepositoryImpl = MemberRepositoryImpl;
