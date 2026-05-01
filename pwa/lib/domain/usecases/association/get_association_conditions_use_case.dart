import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class GetBandConditionsUseCase {
  // Variables

  final BandRepository _repository;

  // Constructor

  GetBandConditionsUseCase(this._repository);

  // Public methods

  void call(
    String bandId, {
    required Function(List<BandCondition> conditions, AppError? error) onComplete,
  }) =>
      _repository.getBandConditions(bandId, onComplete: onComplete);
}
