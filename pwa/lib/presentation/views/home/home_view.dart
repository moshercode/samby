import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/home/home_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_card.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class HomeView extends BaseView<HomeViewModel> {

  // Constructor

  const HomeView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    final List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.event_rounded),
        label: l.homeTabEvents,
      ),
      if (viewModel.isManager) ...<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.group_rounded),
          label: l.homeTabMembers,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business_rounded),
          label: l.homeTabAssociation,
        ),
      ],
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_rounded),
        label: l.homeTabProfile,
      ),
    ];

    return SafeScaffold(
      body: IndexedStack(
        index: viewModel.tabIndex,
        children: <Widget>[
          _EventsTab(viewModel: viewModel, l: l),
          if (viewModel.isManager) _MembersTab(viewModel: viewModel, l: l),
          if (viewModel.isManager) _AssociationTab(viewModel: viewModel, l: l),
          _ProfileTab(viewModel: viewModel, l: l),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.tabIndex,
        onTap: viewModel.setTab,
        type: BottomNavigationBarType.fixed,
        items: items,
      ),
    );
  }
}

// ── Events tab ────────────────────────────────────────────────────────────────

class _EventsTab extends StatelessWidget {

  // Variables

  final HomeViewModel viewModel;
  final Localization l;

  // Constructor

  const _EventsTab({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.association?.shortName ?? l.homeTabEvents),
        centerTitle: false,
        actions: <Widget>[
          if (viewModel.isManager)
            IconButton(
              icon: const Icon(Icons.add_rounded),
              tooltip: l.createEventTitle,
              onPressed: () => NavigationUtils.showCreateEventView(viewModel),
            ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  // Private methods

  Widget _buildBody(BuildContext context) {
    final List<Event> active = viewModel.activeEvents;
    final List<Event> finished = viewModel.finishedEvents;

    if (active.isEmpty && finished.isEmpty) {
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
              l.eventsEmpty,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(Dimensions.screenMargin),
      children: <Widget>[
        if (active.isNotEmpty) ...<Widget>[
          Text(l.eventsActive, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Dimensions.space12),
          ...active.map((Event e) => _EventCard(
            event: e,
            onTap: () => NavigationUtils.showEventDetailView(viewModel, e.id),
          )),
        ],
        if (finished.isNotEmpty) ...<Widget>[
          if (active.isNotEmpty) const SizedBox(height: Dimensions.space24),
          Text(l.eventsFinished, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Dimensions.space12),
          ...finished.map((Event e) => _EventCard(
            event: e,
            onTap: () => NavigationUtils.showEventDetailView(viewModel, e.id),
          )),
        ],
      ],
    );
  }
}

// ── Members tab ───────────────────────────────────────────────────────────────

class _MembersTab extends StatelessWidget {

  // Variables

  final HomeViewModel viewModel;
  final Localization l;

  // Constructor

  const _MembersTab({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l.homeTabMembers),
        centerTitle: false,
      ),
      body: viewModel.members.isEmpty
          ? Center(
              child: Text(
                l.membersEmpty,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(Dimensions.screenMargin),
              itemCount: viewModel.members.length,
              itemBuilder: (BuildContext context, int index) {
                final Member m = viewModel.members[index];
                return ListTile(
                  title: Text(m.name),
                  subtitle: Text(m.email),
                  trailing: m.isBlocked
                      ? Icon(Icons.block_rounded, color: Theme.of(context).colorScheme.error)
                      : null,
                  onTap: () => NavigationUtils.showMemberDetailView(viewModel, m),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
    );
  }
}

// ── Association tab ───────────────────────────────────────────────────────────

class _AssociationTab extends StatelessWidget {

  // Variables

  final HomeViewModel viewModel;
  final Localization l;

  // Constructor

  const _AssociationTab({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l.associationDetailTitle),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        children: <Widget>[
          Text(l.associationDetailRequirements, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Dimensions.space12),
          SwitchListTile(
            title: Text(l.associationDetailRequireIdDoc),
            value: viewModel.association?.requireIdDoc ?? false,
            onChanged: null,
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            title: Text(l.associationDetailRequireIdDocImage),
            value: viewModel.association?.requireIdDocImage ?? false,
            onChanged: null,
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            title: Text(l.associationDetailRequireGuardian),
            value: viewModel.association?.requireGuardian ?? false,
            onChanged: null,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: Dimensions.space16),
          OutlinedButton(
            onPressed: () => NavigationUtils.showAssociationDetailView(viewModel),
            child: Text(l.edit),
          ),
        ],
      ),
    );
  }
}

// ── Profile tab ───────────────────────────────────────────────────────────────

class _ProfileTab extends StatelessWidget {

  // Variables

  final HomeViewModel viewModel;
  final Localization l;

  // Constructor

  const _ProfileTab({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    final Member? member = viewModel.currentMember;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.profileTitle),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (member != null) ...<Widget>[
              Text(
                member.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: Dimensions.space4),
              Text(
                member.email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: Dimensions.space48),
            TextButton.icon(
              onPressed: viewModel.logout,
              icon: const Icon(Icons.logout_rounded),
              label: Text(l.profileLogout),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Event card ────────────────────────────────────────────────────────────────

class _EventCard extends StatelessWidget {

  // Constants

  static const double _kImageHeight = 140;

  // Variables

  final Event event;
  final VoidCallback onTap;

  // Constructor

  const _EventCard({required this.event, required this.onTap});

  // Build

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.space12),
      child: GestureDetector(
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
                    Text(event.title, style: Theme.of(context).textTheme.titleSmall),
                    if (event.startDate != null) ...<Widget>[
                      const SizedBox(height: Dimensions.space4),
                      Text(
                        _dateRange(event),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
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
