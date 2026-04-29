import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';

class GetMembershipUseCase {
  // Variables

  final MembershipRepository _repository;

  // Constructor

  GetMembershipUseCase(this._repository);

  // Public methods

  void call(
    String associationId,
    String userId, {
    required Function(Membership? membership, AppError? error) onComplete,
  }) =>
      _repository.getMembership(associationId, userId, onComplete: onComplete);
}
