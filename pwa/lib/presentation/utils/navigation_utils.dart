import 'package:samby/core/utils/log.dart';
import 'package:samby/core/utils/ui_utils.dart';
import 'package:samby/presentation/managers/navigation_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:samby/presentation/viewmodels/splash/splash_viewmodel.dart';
import 'package:samby/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:samby/presentation/viewmodels/onboarding/onboarding_viewmodel.dart';
import 'package:samby/presentation/viewmodels/access_request/access_request_viewmodel.dart';
import 'package:samby/presentation/viewmodels/pending_approval/pending_approval_viewmodel.dart';
import 'package:samby/presentation/viewmodels/rejected/rejected_viewmodel.dart';
import 'package:samby/presentation/viewmodels/dashboard/dashboard_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/views/splash/splash_view.dart';
import 'package:samby/presentation/views/authentication/authentication_view.dart';
import 'package:samby/presentation/views/onboarding/onboarding_view.dart';
import 'package:samby/presentation/views/access_request/access_request_view.dart';
import 'package:samby/presentation/views/pending_approval/pending_approval_view.dart';
import 'package:samby/presentation/views/rejected/rejected_view.dart';
import 'package:samby/presentation/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';

enum PresentationMode { push, modal, fade }

abstract class NavigationUtils {
  // Constants

  static const int kTransitionDurationMs = 400;

  // Public methods

  static Future<void> showSplashView(ViewModel from) {
    return _showView(from: from, view: SplashView(SplashViewModel()), mode: PresentationMode.fade, clearStack: true);
  }

  static Future<void> showAuthenticationView(ViewModel from, {required Function onAuthenticated}) {
    return _showView(
      from: from,
      view: AuthenticationView(AuthenticationViewModel(onAuthenticated: onAuthenticated)),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  static Future<void> showOnboardingView(ViewModel from) {
    return _showView(
      from: from,
      view: OnboardingView(OnboardingViewModel()),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  static Future<void> showAccessRequestView(ViewModel from) {
    return _showView(
      from: from,
      view: AccessRequestView(AccessRequestViewModel()),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  static Future<void> showPendingApprovalView(ViewModel from) {
    return _showView(
      from: from,
      view: PendingApprovalView(PendingApprovalViewModel()),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  static Future<void> showRejectedView(ViewModel from) {
    return _showView(
      from: from,
      view: RejectedView(RejectedViewModel()),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  static Future<void> showDashboardView(ViewModel from) {
    return _showView(
      from: from,
      view: DashboardView(DashboardViewModel()),
      mode: PresentationMode.fade,
      clearStack: true,
    );
  }

  // Private methods

  static Future<Object?> _showView({
    required ViewModel from,
    required BaseView<ViewModel> view,
    required PresentationMode mode,
    bool clearStack = false,
    bool replace = false,
  }) async {
    try {
      final NavigationManager nm = NavigationManager.getInstance();
      if (!nm.hasValidNavigator()) {
        Log.error('No valid navigator found');
        return null;
      }
      final PageRouteBuilder<Object> route = _buildRoute(view, mode);
      if (clearStack) {
        from.onStop();
        nm.beginProgrammaticNavigation();
        try {
          return nm.getNavigator().pushAndRemoveUntil(route, (_) => false);
        } finally {
          UIUtils.performActionOnPostFrameCallback(nm.endProgrammaticNavigation);
        }
      } else if (replace) {
        from.onStop();
        return nm.getNavigator().pushReplacement(route);
      } else {
        from.onPause();
        return nm.getNavigator().push(route).then((_) {
          view.viewModel.onStop();
          if (!nm.isProgrammaticNavigationInProgress()) from.onResume();
          return null;
        });
      }
    } on Exception catch (e) {
      Log.error('Navigation error: $e');
      return null;
    }
  }

  static PageRouteBuilder<Object> _buildRoute(BaseView<ViewModel> view, PresentationMode mode) {
    return PageRouteBuilder<Object>(
      settings: RouteSettings(name: view.runtimeType.toString()),
      pageBuilder: (_, _, _) => view,
      transitionDuration: const Duration(milliseconds: kTransitionDurationMs),
      reverseTransitionDuration: const Duration(milliseconds: kTransitionDurationMs),
      transitionsBuilder: (_, Animation<double> animation, _, Widget child) {
        switch (mode) {
          case PresentationMode.fade:
            return FadeTransition(opacity: animation, child: child);
          case PresentationMode.modal:
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: Curves.ease)),
              ),
              child: child,
            );
          case PresentationMode.push:
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.ease)),
              ),
              child: child,
            );
        }
      },
    );
  }
}
