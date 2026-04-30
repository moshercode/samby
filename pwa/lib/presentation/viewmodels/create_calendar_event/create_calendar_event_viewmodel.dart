import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class CreateCalendarEventViewModel extends ViewModel {
  // Variables

  final String eventId;
  String title = '';
  String description = '';
  DateTime? eventDate;
  DateTime? endDate;

  bool get isValid =>
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty &&
      eventDate != null;

  // Constructor

  CreateCalendarEventViewModel(this.eventId);

  @override
  String getScreenName() => 'create_calendar_event';

  // Public methods

  void onTitleChanged(String v) {
    title = v;
    notifyListeners();
  }

  void onDescriptionChanged(String v) {
    description = v;
    notifyListeners();
  }

  void setEventDate(DateTime d) {
    eventDate = d;
    notifyListeners();
  }

  void setEndDate(DateTime? d) {
    endDate = d;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isValid) return;
    setLoading(true);

    final String? userId = UserManager.instance.user?.uid;
    if (userId == null) {
      setLoading(false);
      return;
    }

    final Completer<bool> completer = Completer<bool>();
    sl<EventRepository>().createEventAppointment(
      eventId: eventId,
      title: title.trim(),
      description: description.trim(),
      eventDate: eventDate!.toUtc().toIso8601String(),
      endDate: endDate?.toUtc().toIso8601String(),
      createdBy: userId,
      onComplete: (dynamic error) => completer.complete(error == null),
    );

    final bool success = await completer.future;
    setLoading(false);
    if (success) pop();
  }
}
