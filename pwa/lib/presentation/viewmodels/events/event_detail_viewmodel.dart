import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/event_access_request.dart';
import 'package:samby/domain/entities/event_appointment.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class EventDetailViewModel extends ViewModel {
  // Variables

  final String eventId;
  Event? event;
  EventAccessRequest? accessRequest;

  bool get isManager => SessionDataManager.instance.member?.isManager ?? false;
  String? get _memberId => UserManager.instance.user?.uid;

  bool get hasFullAccess {
    if (isManager) return true;
    final Event? e = event;
    if (e == null) return false;
    if (e.freeEntry) return true;
    return e.hasAccessFor(_memberId);
  }

  bool get isLocked => !hasFullAccess && accessRequest == null;
  bool get isAccessPending => !hasFullAccess && (accessRequest?.isPending ?? false);
  bool get isAccessRejected => !hasFullAccess && (accessRequest?.isRejected ?? false);

  List<EventAppointment> get upcomingAppointments {
    final DateTime now = DateTime.now();
    return event?.appointments
            .where((EventAppointment a) => a.eventDate.isAfter(now))
            .toList() ??
        <EventAppointment>[];
  }

  // Constructor

  EventDetailViewModel(this.eventId);

  @override
  String getScreenName() => 'event_detail';

  @override
  void onStart() {
    super.onStart();
    _load();
  }

  @override
  void onResume() {
    super.onResume();
    _load();
  }

  // Public methods

  Future<void> requestAccess() async {
    final String? memberId = _memberId;
    if (memberId == null) return;
    setLoading(true);
    final Completer<void> completer = Completer<void>();
    sl<EventRepository>().requestEventAccess(
      eventId,
      memberId,
      onComplete: (_) => completer.complete(),
    );
    await completer.future;
    await _loadAccessRequest();
    setLoading(false);
  }

  // Private methods

  void _load() {
    setLoading(true);
    sl<EventRepository>().getEventDetail(
      eventId,
      onComplete: (Event? e, dynamic _) async {
        event = e;
        if (e != null && !isManager && !e.freeEntry && !e.hasAccessFor(_memberId)) {
          await _loadAccessRequest();
        }
        setLoading(false);
      },
    );
  }

  Future<void> _loadAccessRequest() async {
    final String? memberId = _memberId;
    if (memberId == null) return;
    final Completer<void> completer = Completer<void>();
    sl<EventRepository>().getEventMember(
      eventId,
      memberId,
      onComplete: (EventAccessRequest? req, dynamic _) {
        accessRequest = req;
        completer.complete();
      },
    );
    await completer.future;
    notifyListeners();
  }
}
