import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/dashboard/dashboard_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_card.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class DashboardView extends BaseView<DashboardViewModel> {

  // Constructor

  const DashboardView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);
    final String? assocName = SessionDataManager.instance.association?.name;

    return SafeScaffold(
      appBar: AppBar(
        title: Text(assocName ?? l.dashboardTitle),
        centerTitle: false,
        actions: <Widget>[
          if (viewModel.isManager) ...<Widget>[
            IconButton(
              icon: const Icon(Icons.group_rounded),
              onPressed: () => NavigationUtils.showMembersView(viewModel),
              tooltip: l.membersTitle,
            ),
            IconButton(
              icon: const Icon(Icons.add_rounded),
              onPressed: () => NavigationUtils.showCreateEventView(viewModel),
              tooltip: l.createEventTitle,
            ),
          ],
        ],
      ),
      body: viewModel.events.isEmpty
          ? _buildEmpty(context, l)
          : _buildList(context, l),
    );
  }

  // Private methods

  Widget _buildEmpty(BuildContext context, Localization l) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.event_outlined,
            size: Dimensions.iconXXl,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: Dimensions.space16),
          Text(
            l.dashboardNoEvents,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, Localization l) {
    return ListView(
      padding: const EdgeInsets.all(Dimensions.screenMargin),
      children: <Widget>[
        Text(l.dashboardActiveEvents, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space12),
        ...viewModel.events.map(
          (Event e) => Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.space12),
            child: _EventCard(
              event: e,
              onTap: () => NavigationUtils.showEventDetailView(viewModel, e.id),
            ),
          ),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {

  // Constants

  static const double _kImageHeight = 160;
  static const double _kActiveDotSize = Dimensions.space8;

  // Variables

  final Event event;
  final VoidCallback onTap;

  // Constructor

  const _EventCard({required this.event, required this.onTap});

  // Build

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (event.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Dimensions.radiusLg),
                ),
                child: CachedNetworkImage(
                  imageUrl: event.imageUrl,
                  height: _kImageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          event.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      if (event.isActive)
                        Container(
                          width: _kActiveDotSize,
                          height: _kActiveDotSize,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.space4),
                  Text(
                    _dateRange(event),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (event.description.isNotEmpty) ...<Widget>[
                    const SizedBox(height: Dimensions.space8),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Private methods

  String _dateRange(Event e) {
    if (e.startDate == null) return '';
    if (e.endDate != null) return '${_fmt(e.startDate!)} – ${_fmt(e.endDate!)}';
    return _fmt(e.startDate!);
  }

  String _fmt(DateTime d) {
    final DateTime local = d.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}/'
        '${local.year}';
  }
}
