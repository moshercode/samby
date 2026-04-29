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
    String userId, {
    required Function(List<Membership> memberships, AppError? error) onComplete,
  }) =>
      _repository.getManagerMemberships(userId, onComplete: onComplete);
}
