import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/domain/usecases/association/find_association_by_subdomain_use_case.dart';

final class SessionDataManager {
  // Variables

  static SessionDataManager? _instance;
  static SessionDataManager get instance => _instance ??= SessionDataManager._();

  Band? band;
  Member? member;

  // Constructor

  SessionDataManager._();

  // Public methods

  void loadBand(String subdomain, {required Function onComplete}) {
    FindBandBySubdomainUseCase(sl<BandRepository>()).call(
      subdomain,
      onComplete: (Band? result, AppError? _) {
        band = result;
        onComplete();
      },
    );
  }

  void loadMember(
    String memberId, {
    required Function onComplete,
  }) {
    sl<MemberRepository>().getMember(
      memberId,
      onComplete: (Member? result, AppError? _) {
        member = result;
        onComplete();
      },
    );
  }

  void clearMember() {
    member = null;
  }

  void clear() {
    band = null;
    member = null;
  }
}
