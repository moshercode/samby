import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/presentation/managers/samby_theme_manager.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:web/web.dart' as web;

class SplashViewModel extends ViewModel {
  // Constants

  static const String kCreateSubdomain = 'create';
  static const String kDevSubdomain = 'create';

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
      Future.delayed(Duration(seconds: 2), () => _proceedWithCreateFlow());
      return;
    }

    SessionDataManager.instance.loadAssociation(subdomain, onComplete: _onAssociationLoaded);
  }

  String _resolveSubdomain() {
    final String hostname = web.window.location.hostname;
    if (hostname.contains('localhost')) return kDevSubdomain;
    final List<String> parts = hostname.split('.');
    if (parts.length > 2) return parts[0];
    return kCreateSubdomain;
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
    if (UserManager.instance.isAuthenticated) {
      _checkMembership(UserManager.instance.user!.uid);
    } else {
      NavigationUtils.showAuthenticationView(this, onAuthenticated: () => _checkMembership(UserManager.instance.user!.uid));
    }
  }

  void _checkMembership(String memberId) {
    SessionDataManager.instance.loadMember(memberId, onComplete: _routeByMember);
  }

  void _routeByMember() {
    final Member? member = SessionDataManager.instance.member;
    if (member == null) {
      NavigationUtils.showAccessRequestView(this);
      return;
    }
    switch (member.status) {
      case MemberStatus.approved:
        NavigationUtils.showHomeView(this);
      case MemberStatus.pending:
        if (member.requestedAt != null) {
          NavigationUtils.showMembershipStatusView(this);
        } else {
          NavigationUtils.showAccessRequestView(this);
        }
      case MemberStatus.rejected:
        NavigationUtils.showMembershipStatusView(this);
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
    final String? email = UserManager.instance.userEmail;
    if (email == null) {
      NavigationUtils.showOnboardingView(this);
      return;
    }
    sl<AssociationRepository>().findAssociationByFounderEmail(
      email,
      onComplete: (Association? association, dynamic _) {
        if (association != null) {
          web.window.location.href = 'https://${association.subdomain}.samby.app';
        } else {
          NavigationUtils.showOnboardingView(this);
        }
      },
    );
  }
}
