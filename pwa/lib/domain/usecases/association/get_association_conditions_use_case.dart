import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class GetAssociationConditionsUseCase {
  // Variables

  final AssociationRepository _repository;

  // Constructor

  GetAssociationConditionsUseCase(this._repository);

  // Public methods

  void call(
    String associationId, {
    required Function(List<AssociationCondition> conditions, AppError? error) onComplete,
  }) =>
      _repository.getAssociationConditions(associationId, onComplete: onComplete);
}
