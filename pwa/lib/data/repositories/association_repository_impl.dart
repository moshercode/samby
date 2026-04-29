import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class AssociationRepositoryImpl implements AssociationRepository {
  // Variables

  final DataconnectDatasource _datasource;

  // Constructor

  AssociationRepositoryImpl(this._datasource);

  // Public methods

  @override
  void findAssociationBySubdomain(
    String subdomain, {
    required Function(Association? association, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getAssociationBySubdomain,
        variables: {DataconnectKeys.subdomain: subdomain},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.association] as Map<String, dynamic>?;
      final Association? association = raw != null ? Association.fromMap(raw) : null;
      onComplete(association, null);
    } on AppError catch (e) {
      Log.error('AssociationRepositoryImpl.findAssociationBySubdomain: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('AssociationRepositoryImpl.findAssociationBySubdomain unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void getAssociationConditions(
    String associationId, {
    required Function(List<AssociationCondition> conditions, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getAssociationConditions,
        variables: {DataconnectKeys.associationId: associationId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.associationConditions] as List<dynamic>? ?? <dynamic>[];
      final List<AssociationCondition> conditions = raw
          .map((dynamic c) => AssociationCondition.fromMap(c as Map<String, dynamic>))
          .toList();
      onComplete(conditions, null);
    } on AppError catch (e) {
      Log.error('AssociationRepositoryImpl.getAssociationConditions: $e');
      onComplete(<AssociationCondition>[], e);
    } catch (e) {
      Log.error('AssociationRepositoryImpl.getAssociationConditions unknown: $e');
      onComplete(<AssociationCondition>[], DataError(e.toString()));
    }
  }

  @override
  void createAssociation(
    String name,
    String shortName,
    String subdomain,
    String primaryColor,
    String secondaryColor, {
    required Function(String? associationId, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeMutation(
        DataconnectOps.createAssociation,
        variables: {
          DataconnectKeys.name: name,
          DataconnectKeys.shortName: shortName,
          DataconnectKeys.subdomain: subdomain,
          DataconnectKeys.primaryColor: primaryColor,
          DataconnectKeys.secondaryColor: secondaryColor,
        },
      );
      final String? id = (data?['association_insert'] as Map<String, dynamic>?)?['id'] as String?;
      onComplete(id, null);
    } on AppError catch (e) {
      Log.error('AssociationRepositoryImpl.createAssociation: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('AssociationRepositoryImpl.createAssociation unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }
}
