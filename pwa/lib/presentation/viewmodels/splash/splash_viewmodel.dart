import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/samby_theme_manager.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:web/web.dart' as web;

class SplashViewModel extends ViewModel {
  // Constants

  static const String kCreateSubdomain = 'create';
  static const String kDevSubdomain = 'lacomparsa';

  // Variables

  String? error;

  // Constructor

  SplashViewModel();

  @override
  String getScreenName() => 'splash';

  // Public methods

  @override
  void onStart() {
    super.onStart();
    _load();
  }

  // Private methods

  Future<void> _load() async {
    final String subdomain = _resolveSubdomain();

    if (subdomain == kCreateSubdomain) {
      _proceedWithCreateFlow();
      return;
    }

    SessionDataManager.instance.loadAssociation(
      subdomain,
      onComplete: _onAssociationLoaded,
    );
  }

  Future<void> _onAssociationLoaded() async {
    final Association? assoc = SessionDataManager.instance.association;
    if (assoc == null) {
      error = 'not_found';
      notifyListeners();
      return;
    }
    await SambyThemeManager.instance.setThemeColors(assoc.primaryColor, assoc.secondaryColor);
    _checkAuth();
  }

  void _checkAuth() {
    final String? uid = UserManager.instance.user?.uid;
    if (uid == null) {
      NavigationUtils.showAuthenticationView(this, onAuthenticated: _onAuthenticated);
    } else {
      _checkMembership(uid);
    }
  }

  void _onAuthenticated() {
    final String? uid = UserManager.instance.user?.uid;
    if (uid != null) _checkMembership(uid);
  }

  void _checkMembership(String userId) {
    final String associationId = SessionDataManager.instance.association!.id;
    SessionDataManager.instance.loadMembership(
      associationId,
      userId,
      onComplete: _routeByMembership,
    );
  }

  void _routeByMembership() {
    final Membership? membership = SessionDataManager.instance.membership;
    if (membership == null) {
      NavigationUtils.showAccessRequestView(this);
      return;
    }
    switch (membership.status) {
      case MembershipStatus.approved:
        NavigationUtils.showDashboardView(this);
      case MembershipStatus.pending:
        NavigationUtils.showPendingApprovalView(this);
      case MembershipStatus.rejected:
        NavigationUtils.showRejectedView(this);
    }
  }

  // create.samby.app flow

  void _proceedWithCreateFlow() {
    final String? uid = UserManager.instance.user?.uid;
    if (uid == null) {
      NavigationUtils.showAuthenticationView(this, onAuthenticated: _onCreateAuthenticated);
    } else {
      _onCreateAuthenticated();
    }
  }

  void _onCreateAuthenticated() {
    NavigationUtils.showOnboardingView(this);
  }

  String _resolveSubdomain() {
    final String hostname = web.window.location.hostname;
    if (hostname.contains('localhost')) return kDevSubdomain;
    final List<String> parts = hostname.split('.');
    if (parts.length > 2) return parts[0];
    return kCreateSubdomain;
  }
}
