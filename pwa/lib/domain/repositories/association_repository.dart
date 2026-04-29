import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/association_condition.dart';

abstract class AssociationRepository {
  void findAssociationBySubdomain(
    String subdomain, {
    required Function(Association? association, AppError? error) onComplete,
  });

  void getAssociationConditions(
    String associationId, {
    required Function(List<AssociationCondition> conditions, AppError? error) onComplete,
  });

  void createAssociation(
    String name,
    String shortName,
    String subdomain,
    String primaryColor,
    String secondaryColor, {
    required Function(String? associationId, AppError? error) onComplete,
  });
}
