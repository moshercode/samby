import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/event_appointment.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class EventAppointmentDetailViewModel extends ViewModel {
  // Variables

  final String appointmentId;
  EventAppointment? appointment;

  // Constructor

  EventAppointmentDetailViewModel(this.appointmentId);

  @override
  String getScreenName() => 'event_appointment_detail';

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

  // Private methods

  void _load() {
    setLoading(true);
    sl<EventRepository>().getEventAppointmentDetail(
      appointmentId,
      onComplete: (EventAppointment? a, dynamic _) {
        appointment = a;
        setLoading(false);
      },
    );
  }
}
