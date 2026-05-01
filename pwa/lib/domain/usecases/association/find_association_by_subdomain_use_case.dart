import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class FindBandBySubdomainUseCase {
  // Variables

  final BandRepository _repository;

  // Constructor

  FindBandBySubdomainUseCase(this._repository);

  // Public methods

  void call(
    String subdomain, {
    required Function(Band? band, AppError? error) onComplete,
  }) =>
      _repository.findBandBySubdomain(subdomain, onComplete: onComplete);
}
