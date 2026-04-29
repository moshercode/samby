import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class FindAssociationBySubdomainUseCase {
  // Variables

  final AssociationRepository _repository;

  // Constructor

  FindAssociationBySubdomainUseCase(this._repository);

  // Public methods

  void call(
    String subdomain, {
    required Function(Association? association, AppError? error) onComplete,
  }) =>
      _repository.findAssociationBySubdomain(subdomain, onComplete: onComplete);
}
