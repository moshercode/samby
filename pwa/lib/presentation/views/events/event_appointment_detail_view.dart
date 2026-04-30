import 'package:flutter/material.dart';
import 'package:samby/domain/entities/event_appointment.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/event_appointment_detail/event_appointment_detail_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class EventAppointmentDetailView extends BaseView<EventAppointmentDetailViewModel> {

  // Constructor

  const EventAppointmentDetailView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    if (viewModel.isLoading()) {
      return SafeScaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final EventAppointment? appointment = viewModel.appointment;
    if (appointment == null) {
      return SafeScaffold(
        appBar: AppBar(),
        body: Center(child: Text(l.errorGeneric)),
      );
    }

    return SafeScaffold(
      appBar: AppBar(
        title: Text(appointment.title),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appointment.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: Dimensions.space4),
            Text(
              _formatDateTime(appointment.eventDate, appointment.endDate),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            if (appointment.description.isNotEmpty) ...<Widget>[
              const SizedBox(height: Dimensions.space16),
              Text(
                appointment.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Private methods

  String _formatDateTime(DateTime start, DateTime? end) {
    final String startStr = _fmt(start.toLocal());
    if (end == null) return startStr;
    return '$startStr – ${_fmt(end.toLocal())}';
  }

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/'
      '${d.month.toString().padLeft(2, '0')}/'
      '${d.year} '
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}
