import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/data/datasources/dataconnect_datasource.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/repositories/association_repository.dart';

class BandRepositoryImpl implements BandRepository {
  // Variables

  final DataconnectDatasource _datasource;

  // Constructor

  BandRepositoryImpl(this._datasource);

  // Public methods

  @override
  void findBandBySubdomain(
    String subdomain, {
    required Function(Band? band, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getBandBySubdomain,
        variables: {DataconnectKeys.subdomain: subdomain},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.band] as Map<String, dynamic>?;
      final Band? band = raw != null ? Band.fromMap(raw) : null;
      onComplete(band, null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.findBandBySubdomain: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('BandRepositoryImpl.findBandBySubdomain unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void findBandByFounderEmail(
    String founderEmail, {
    required Function(Band? band, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getBandByFounderEmail,
        variables: {DataconnectKeys.founderEmail: founderEmail},
      );
      final Map<String, dynamic>? raw =
          data?[DataconnectResponseKeys.band] as Map<String, dynamic>?;
      final Band? band = raw != null ? Band.fromMap(raw) : null;
      onComplete(band, null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.findBandByFounderEmail: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('BandRepositoryImpl.findBandByFounderEmail unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }

  @override
  void getBandConditions(
    String bandId, {
    required Function(List<BandCondition> conditions, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeQuery(
        DataconnectOps.getBandConditions,
        variables: {DataconnectKeys.bandId: bandId},
      );
      final List<dynamic> raw =
          data?[DataconnectResponseKeys.bandConditions] as List<dynamic>? ?? <dynamic>[];
      final List<BandCondition> conditions = raw
          .map((dynamic c) => BandCondition.fromMap(c as Map<String, dynamic>))
          .toList();
      onComplete(conditions, null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.getBandConditions: $e');
      onComplete(<BandCondition>[], e);
    } catch (e) {
      Log.error('BandRepositoryImpl.getBandConditions unknown: $e');
      onComplete(<BandCondition>[], DataError(e.toString()));
    }
  }

  @override
  void createBandCondition(
    String bandId,
    String type,
    String content,
    int sortOrder, {
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.createBandCondition,
        variables: {
          DataconnectKeys.bandId: bandId,
          DataconnectKeys.type: type,
          DataconnectKeys.content: content,
          DataconnectKeys.sortOrder: sortOrder,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.createBandCondition: $e');
      onComplete(e);
    } catch (e) {
      Log.error('BandRepositoryImpl.createBandCondition unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void updateBand(
    String bandId, {
    required bool requireIdDoc,
    required bool requireIdDocImage,
    required bool requireGuardian,
    required Function(AppError? error) onComplete,
  }) async {
    try {
      await _datasource.executeMutation(
        DataconnectOps.updateBand,
        variables: {
          DataconnectKeys.id: bandId,
          DataconnectKeys.requireIdDoc: requireIdDoc,
          DataconnectKeys.requireIdDocImage: requireIdDocImage,
          DataconnectKeys.requireGuardian: requireGuardian,
        },
      );
      onComplete(null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.updateBand: $e');
      onComplete(e);
    } catch (e) {
      Log.error('BandRepositoryImpl.updateBand unknown: $e');
      onComplete(DataError(e.toString()));
    }
  }

  @override
  void createBand(
    String name,
    String shortName,
    String subdomain,
    String primaryColor,
    String secondaryColor,
    String founderEmail, {
    required Function(String? bandId, AppError? error) onComplete,
  }) async {
    try {
      final Map<String, dynamic>? data = await _datasource.executeMutation(
        DataconnectOps.createBand,
        variables: {
          DataconnectKeys.name: name,
          DataconnectKeys.shortName: shortName,
          DataconnectKeys.subdomain: subdomain,
          DataconnectKeys.primaryColor: primaryColor,
          DataconnectKeys.secondaryColor: secondaryColor,
          DataconnectKeys.founderEmail: founderEmail,
        },
      );
      final String? id = (data?['band_insert'] as Map<String, dynamic>?)?['id'] as String?;
      onComplete(id, null);
    } on AppError catch (e) {
      Log.error('BandRepositoryImpl.createBand: $e');
      onComplete(null, e);
    } catch (e) {
      Log.error('BandRepositoryImpl.createBand unknown: $e');
      onComplete(null, DataError(e.toString()));
    }
  }
}
