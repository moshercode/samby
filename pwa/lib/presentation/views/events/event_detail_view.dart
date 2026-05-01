import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/domain/entities/event_appointment.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/events/event_detail_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_card.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class EventDetailView extends BaseView<EventDetailViewModel> {
  // Constants

  static const double _kHeaderImageHeight = 220;

  // Constructor

  const EventDetailView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    if (viewModel.isLoading() && viewModel.event == null) {
      return SafeScaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final event = viewModel.event;
    if (event == null) {
      return SafeScaffold(
        appBar: AppBar(),
        body: Center(child: Text(l.errorGeneric)),
      );
    }

    return SafeScaffold(
      appBar: AppBar(
        title: Text(event.title),
        centerTitle: false,
        actions: viewModel.isManager
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_rounded),
                  tooltip: l.createAppointmentTitle,
                  onPressed: () => NavigationUtils.showCreateEventAppointmentView(viewModel, event.id),
                ),
              ]
            : null,
      ),
      body: ListView(
        children: <Widget>[
          if (event.imageUrl.isNotEmpty)
            CachedNetworkImage(
              imageUrl: event.imageUrl,
              height: _kHeaderImageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const SizedBox.shrink(),
            ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.screenMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(event.title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: Dimensions.space4),
                if (event.startDate != null)
                  Text(
                    _dateRange(event.startDate!, event.endDate),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                if (event.description.isNotEmpty) ...<Widget>[
                  const SizedBox(height: Dimensions.space12),
                  Text(event.description, style: Theme.of(context).textTheme.bodyMedium),
                ],
                const SizedBox(height: Dimensions.space24),
                if (!viewModel.hasFullAccess) _AccessControlBanner(viewModel: viewModel, l: l) else _AppointmentsSection(viewModel: viewModel, l: l),
                if (viewModel.isManager && event.memberNames.isNotEmpty) ...<Widget>[
                  const SizedBox(height: Dimensions.space24),
                  Text(l.eventDetailMembers, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: Dimensions.space8),
                  Wrap(
                    spacing: Dimensions.space8,
                    runSpacing: Dimensions.space4,
                    children: event.memberNames
                        .where((String n) => n.isNotEmpty)
                        .map(
                          (String name) => Chip(
                            label: Text(name, style: Theme.of(context).textTheme.labelSmall),
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Private methods

  String _dateRange(DateTime start, DateTime? end) {
    if (end != null) return '${_fmt(start)} – ${_fmt(end)}';
    return _fmt(start);
  }

  String _fmt(DateTime d) {
    final DateTime local = d.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}/'
        '${local.year}';
  }
}

// ── Access control banner ─────────────────────────────────────────────────────

class _AccessControlBanner extends StatelessWidget {
  // Variables

  final EventDetailViewModel viewModel;
  final Localization l;

  // Constructor

  const _AccessControlBanner({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    if (viewModel.isAccessPending) {
      return _buildBanner(
        context,
        icon: Icons.hourglass_empty_rounded,
        color: Theme.of(context).colorScheme.tertiary,
        message: l.eventDetailAccessPending,
      );
    }
    if (viewModel.isAccessRejected) {
      return _buildBanner(context, icon: Icons.cancel_outlined, color: Theme.of(context).colorScheme.error, message: l.eventDetailAccessRejected);
    }
    final String conditionText = viewModel.event?.entryCondition?.isNotEmpty == true ? viewModel.event!.entryCondition! : l.eventDetailRequestAccess;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildBanner(context, icon: Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.onSurfaceVariant, message: conditionText),
        const SizedBox(height: Dimensions.space16),
        Button(title: l.eventDetailRequestAccess, loading: viewModel.isLoading(), onTap: viewModel.requestAccess),
      ],
    );
  }

  // Private methods

  Widget _buildBanner(BuildContext context, {required IconData icon, required Color color, required String message}) {
    return Row(
      children: <Widget>[
        Icon(icon, size: Dimensions.iconLg, color: color),
        const SizedBox(width: Dimensions.space12),
        Expanded(
          child: Text(message.isNotEmpty ? message : l.eventDetailFreeEntry, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color)),
        ),
      ],
    );
  }
}

// ── Appointments section ──────────────────────────────────────────────────────

class _AppointmentsSection extends StatelessWidget {
  // Variables

  final EventDetailViewModel viewModel;
  final Localization l;

  // Constructor

  const _AppointmentsSection({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l.eventDetailSessions, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space12),
        if (viewModel.upcomingAppointments.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space16),
              child: Text(
                l.eventDetailNoSessions,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ),
          )
        else
          ...viewModel.upcomingAppointments.map(
            (EventAppointment a) => Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space8),
              child: _AppointmentCard(appointment: a, viewModel: viewModel),
            ),
          ),
      ],
    );
  }
}

// ── Appointment card ──────────────────────────────────────────────────────────

class _AppointmentCard extends StatelessWidget {
  // Constants

  static const double _kStripeWidth = 4;

  // Variables

  final EventAppointment appointment;
  final EventDetailViewModel viewModel;

  // Constructor

  const _AppointmentCard({required this.appointment, required this.viewModel});

  // Build

  @override
  Widget build(BuildContext context) {
    final DateTime local = appointment.eventDate.toLocal();
    final String dateStr =
        '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}'
        ' · ${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';

    return GestureDetector(
      onTap: () => NavigationUtils.showEventAppointmentDetailView(viewModel, appointment.id),
      child: AppCard(
        child: Row(
          children: <Widget>[
            Container(
              width: _kStripeWidth,
              height: Dimensions.space48,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(Dimensions.radiusXs)),
            ),
            const SizedBox(width: Dimensions.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(appointment.title, style: Theme.of(context).textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: Dimensions.space4),
                  Text(dateStr, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: Dimensions.iconMd, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
