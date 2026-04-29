import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/errors/app_errors.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/domain/usecases/association/find_association_by_subdomain_use_case.dart';
import 'package:samby/domain/usecases/membership/get_membership_use_case.dart';

final class SessionDataManager {
  // Variables

  static SessionDataManager? _instance;
  static SessionDataManager get instance => _instance ??= SessionDataManager._();

  Association? association;
  Membership? membership;

  // Constructor

  SessionDataManager._();

  // Public methods

  void loadAssociation(String subdomain, {required Function onComplete}) {
    FindAssociationBySubdomainUseCase(sl<AssociationRepository>()).call(
      subdomain,
      onComplete: (Association? result, AppError? _) {
        association = result;
        onComplete();
      },
    );
  }

  void loadMembership(
    String associationId,
    String userId, {
    required Function onComplete,
  }) {
    GetMembershipUseCase(sl<MembershipRepository>()).call(
      associationId,
      userId,
      onComplete: (Membership? result, AppError? _) {
        membership = result;
        onComplete();
      },
    );
  }

  void clearMembership() {
    membership = null;
  }

  void clear() {
    association = null;
    membership = null;
  }
}
