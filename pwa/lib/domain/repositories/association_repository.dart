import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/association_condition.dart';

abstract class BandRepository {
  void findBandBySubdomain(
    String subdomain, {
    required Function(Band? band, AppError? error) onComplete,
  });

  void findBandByFounderEmail(
    String founderEmail, {
    required Function(Band? band, AppError? error) onComplete,
  });

  void getBandConditions(
    String bandId, {
    required Function(List<BandCondition> conditions, AppError? error) onComplete,
  });

  void createBand(
    String name,
    String shortName,
    String subdomain,
    String primaryColor,
    String secondaryColor,
    String founderEmail, {
    required Function(String? bandId, AppError? error) onComplete,
  });

  void createBandCondition(
    String bandId,
    String type,
    String content,
    int sortOrder, {
    required Function(AppError? error) onComplete,
  });

  void updateBand(
    String bandId, {
    required bool requireIdDoc,
    required bool requireIdDocImage,
    required bool requireGuardian,
    required Function(AppError? error) onComplete,
  });
}
