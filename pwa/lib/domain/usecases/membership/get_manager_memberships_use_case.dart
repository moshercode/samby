import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';

class GetManagerMembershipsUseCase {
  // Variables

  final MembershipRepository _repository;

  // Constructor

  GetManagerMembershipsUseCase(this._repository);

  // Public methods

  void call(
    String memberId, {
    required Function(List<Member> memberships, AppError? error) onComplete,
  }) =>
      _repository.getMember(
        memberId,
        onComplete: (Member? member, AppError? error) {
          if (member != null && member.isManager) {
            onComplete(<Member>[member], null);
          } else {
            onComplete(<Member>[], error);
          }
        },
      );
}
