import 'package:flutter/material.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/core/utils/ui_utils.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/navigation_manager.dart';
import 'package:samby/presentation/viewmodels/access_request/access_request_viewmodel.dart';
import 'package:samby/presentation/viewmodels/association/association_detail_viewmodel.dart';

import 'package:samby/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:samby/presentation/viewmodels/events/create_event_viewmodel.dart';
import 'package:samby/presentation/viewmodels/events/create_event_appointment_viewmodel.dart';
import 'package:samby/presentation/viewmodels/events/event_appointment_detail_viewmodel.dart';
import 'package:samby/presentation/viewmodels/events/event_detail_viewmodel.dart';
import 'package:samby/presentation/viewmodels/home/home_viewmodel.dart';
import 'package:samby/presentation/viewmodels/members/member_detail_viewmodel.dart';
import 'package:samby/presentation/viewmodels/members/members_viewmodel.dart';
import 'package:samby/presentation/viewmodels/members/membership_status_viewmodel.dart';
import 'package:samby/presentation/viewmodels/association/onboarding_viewmodel.dart';
import 'package:samby/presentation/viewmodels/splash/splash_viewmodel.dart';
import 'package:samby/presentation/views/members/access_request_view.dart';
import 'package:samby/presentation/views/association/association_detail_view.dart';
import 'package:samby/presentation/views/authentication/authentication_view.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/views/events/create_event_view.dart';
import 'package:samby/presentation/views/events/create_event_appointment_view.dart';
import 'package:samby/presentation/views/events/event_appointment_detail_view.dart';
import 'package:samby/presentation/views/events/event_detail_view.dart';
import 'package:samby/presentation/views/home/home_view.dart';
import 'package:samby/presentation/views/image_detail/image_detail_view.dart';
import 'package:samby/presentation/views/members/member_detail_view.dart';
import 'package:samby/presentation/views/members/members_view.dart';
import 'package:samby/presentation/views/members/membership_status_view.dart';
import 'package:samby/presentation/views/association/onboarding_view.dart';
import 'package:samby/presentation/views/splash/splash_view.dart';

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
    return _showView(from: from, view: OnboardingView(OnboardingViewModel()), mode: PresentationMode.fade, clearStack: true);
  }

  static Future<void> showAccessRequestView(ViewModel from) {
    return _showView(from: from, view: AccessRequestView(AccessRequestViewModel()), mode: PresentationMode.fade, clearStack: true);
  }

  static Future<void> showMembershipStatusView(ViewModel from) {
    return _showView(from: from, view: MembershipStatusView(MembershipStatusViewModel()), mode: PresentationMode.fade, clearStack: true);
  }

  static Future<void> showHomeView(ViewModel from) {
    return _showView(from: from, view: HomeView(HomeViewModel()), mode: PresentationMode.fade, clearStack: true);
  }

  static Future<void> showMembersView(ViewModel from) {
    return _showView(from: from, view: MembersView(MembersViewModel()), mode: PresentationMode.push);
  }

  static Future<void> showEventDetailView(ViewModel from, String eventId) {
    return _showView(from: from, view: EventDetailView(EventDetailViewModel(eventId)), mode: PresentationMode.push);
  }

  static Future<void> showCreateEventView(ViewModel from) {
    return _showView(from: from, view: CreateEventView(CreateEventViewModel()), mode: PresentationMode.modal);
  }

  static Future<void> showCreateEventAppointmentView(ViewModel from, String eventId) {
    return _showView(from: from, view: CreateEventAppointmentView(CreateEventAppointmentViewModel(eventId)), mode: PresentationMode.modal);
  }

  static Future<void> showEventAppointmentDetailView(ViewModel from, String appointmentId) {
    return _showView(from: from, view: EventAppointmentDetailView(EventAppointmentDetailViewModel(appointmentId)), mode: PresentationMode.push);
  }

  static Future<void> showBandDetailView(ViewModel from) {
    return _showView(from: from, view: BandDetailView(BandDetailViewModel()), mode: PresentationMode.push);
  }

  static Future<void> showMemberDetailView(ViewModel from, Member member) {
    return _showView(from: from, view: MemberDetailView(MemberDetailViewModel(member)), mode: PresentationMode.push);
  }

  static Future<void> showImageDetailView(ViewModel from, String imageUrl) {
    return _showView(
      from: from,
      view: _ImageDetailWrapper(imageUrl: imageUrl),
      mode: PresentationMode.push,
    );
  }

  // Kept for backward compatibility with existing calls
  static Future<void> showDashboardView(ViewModel from) => showHomeView(from);
  static Future<void> showPendingApprovalView(ViewModel from) => showMembershipStatusView(from);
  static Future<void> showRejectedView(ViewModel from) => showMembershipStatusView(from);
  static Future<void> showCreateCalendarEventView(ViewModel from, String eventId) => showCreateEventAppointmentView(from, eventId);

  // Private methods

  static Future<Object?> _showView({
    required ViewModel from,
    required Widget view,
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
          if (view is BaseView) view.viewModel.onStop();
          if (!nm.isProgrammaticNavigationInProgress()) from.onResume();
          return null;
        });
      }
    } on Exception catch (e) {
      Log.error('Navigation error: $e');
      return null;
    }
  }

  static PageRouteBuilder<Object> _buildRoute(Widget view, PresentationMode mode) {
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
              position: animation.drive(Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
          case PresentationMode.push:
            return SlideTransition(
              position: animation.drive(Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
        }
      },
    );
  }
}

// ── Wrapper so ImageDetailView (StatelessWidget) works with _showView ─────────

class _ImageDetailWrapper extends StatelessWidget {
  final String imageUrl;
  const _ImageDetailWrapper({required this.imageUrl});

  @override
  Widget build(BuildContext context) => ImageDetailView(imageUrl: imageUrl);
}
