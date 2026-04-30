import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class DashboardViewModel extends ViewModel {
  // Variables

  List<Event> _allEvents = <Event>[];

  bool get isManager => SessionDataManager.instance.member?.isManager ?? false;
  Member? get member => SessionDataManager.instance.member;

  List<Event> get events {
    final List<Event> visible = _allEvents
        .where((Event e) => e.isActive)
        .toList();
    if (isManager) return visible;
    final String? memberId = member?.id;
    return visible.where((Event e) => e.hasAccessFor(memberId)).toList();
  }

  // Constructor

  DashboardViewModel();

  @override
  String getScreenName() => 'dashboard';

  @override
  void onStart() {
    super.onStart();
    _loadEvents();
  }

  // Private methods

  void _loadEvents() {
    final String? assocId = SessionDataManager.instance.association?.id;
    if (assocId == null) return;
    sl<EventRepository>().getAssociationEvents(
      assocId,
      onComplete: (List<Event> events, dynamic _) {
        _allEvents = events;
        notifyListeners();
      },
    );
  }
}
