import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';

class GetMembershipUseCase {
  // Variables

  final MemberRepository _repository;

  // Constructor

  GetMembershipUseCase(this._repository);

  // Public methods

  void call(
    String memberId, {
    required Function(Member? member, AppError? error) onComplete,
  }) =>
      _repository.getMember(memberId, onComplete: onComplete);
}
