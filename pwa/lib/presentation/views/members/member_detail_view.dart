import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/members/member_detail_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_card.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class MemberDetailView extends BaseView<MemberDetailViewModel> {
  // Constructor

  const MemberDetailView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);
    final Membership m = viewModel.member;

    return SafeScaffold(
      appBar: AppBar(title: Text(m.name), centerTitle: false),
      body: viewModel.isLoading()
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(Dimensions.screenMargin),
              children: <Widget>[
                _ProfileHeader(membership: m),
                const SizedBox(height: Dimensions.space24),
                Text(l.memberDetailPersonalInfo, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Dimensions.space12),
                _InfoCard(membership: m, l: l),
                if (viewModel.canChangeRole) ...<Widget>[const SizedBox(height: Dimensions.space16), _RoleChanger(viewModel: viewModel, l: l)],
                const SizedBox(height: Dimensions.space24),
                Text(l.memberDetailEvents, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Dimensions.space12),
                if (viewModel.events.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space16),
                      child: Text(
                        l.memberDetailNoEvents,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ),
                  )
                else
                  ...viewModel.events.map(
                    (Event e) => Padding(
                      padding: const EdgeInsets.only(bottom: Dimensions.space8),
                      child: _EventRow(event: e),
                    ),
                  ),
              ],
            ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  // Constants

  static const double _kAvatarRadius = Dimensions.iconXXl;

  // Variables

  final Member membership;

  // Constructor

  const _ProfileHeader({required this.membership});

  // Build

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = membership.profileImageUrl;
    final String initials = membership.name.isNotEmpty
        ? membership.name.trim().split(' ').map((String w) => w[0]).take(2).join().toUpperCase()
        : '?';

    return Center(
      child: CircleAvatar(
        radius: _kAvatarRadius,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        backgroundImage: (imageUrl != null && imageUrl.isNotEmpty) ? CachedNetworkImageProvider(imageUrl) : null,
        child: (imageUrl == null || imageUrl.isEmpty)
            ? Text(initials, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer))
            : null,
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  // Variables

  final Member membership;
  final Localization l;

  // Constructor

  const _InfoCard({required this.membership, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: <Widget>[
          _InfoRow(icon: Icons.person_outline_rounded, value: membership.name),
          const Divider(height: Dimensions.space16),
          _InfoRow(icon: Icons.email_outlined, value: membership.email),
          if (membership.phone.isNotEmpty) ...<Widget>[
            const Divider(height: Dimensions.space16),
            _InfoRow(icon: Icons.phone_outlined, value: membership.phone),
          ],
          const Divider(height: Dimensions.space16),
          _RoleBadgeRow(membership: membership, l: l),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  // Variables

  final IconData icon;
  final String value;

  // Constructor

  const _InfoRow({required this.icon, required this.value});

  // Build

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, size: Dimensions.iconMd, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: Dimensions.space12),
        Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}

class _RoleBadgeRow extends StatelessWidget {
  // Variables

  final Member membership;
  final Localization l;

  // Constructor

  const _RoleBadgeRow({required this.membership, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    final String roleLabel = membership.isManager ? l.memberRoleManager : l.memberRoleMember;
    final Color roleColor = membership.isManager ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surfaceContainerHighest;
    final Color textColor = membership.isManager ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface;

    return Row(
      children: <Widget>[
        Icon(Icons.badge_outlined, size: Dimensions.iconMd, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: Dimensions.space12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space8, vertical: Dimensions.space2),
          decoration: BoxDecoration(color: roleColor, borderRadius: BorderRadius.circular(Dimensions.radiusSm)),
          child: Text(roleLabel, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor)),
        ),
        if (membership.isFounder) ...<Widget>[
          const SizedBox(width: Dimensions.space8),
          Icon(Icons.star_rounded, size: Dimensions.iconSm, color: Theme.of(context).colorScheme.tertiary),
        ],
      ],
    );
  }
}

class _RoleChanger extends StatelessWidget {
  // Variables

  final MemberDetailViewModel viewModel;
  final Localization l;

  // Constructor

  const _RoleChanger({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(l.memberDetailChangeRole, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: Dimensions.space16),
        if (viewModel.isRoleLoading)
          SizedBox(width: Dimensions.iconMd, height: Dimensions.iconMd, child: const CircularProgressIndicator(strokeWidth: 2))
        else
          SegmentedButton<MemberRole>(
            segments: <ButtonSegment<MemberRole>>[
              ButtonSegment<MemberRole>(value: MemberRole.member, label: Text(l.memberRoleMember)),
              ButtonSegment<MemberRole>(value: MemberRole.manager, label: Text(l.memberRoleManager)),
            ],
            selected: <MemberRole>{viewModel.member.role},
            onSelectionChanged: (Set<MemberRole> selected) => viewModel.updateRole(selected.first),
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
          ),
      ],
    );
  }
}

class _EventRow extends StatelessWidget {
  // Constants

  static const double _kThumbnailSize = 72;

  // Variables

  final Event event;

  // Constructor

  const _EventRow({required this.event});

  // Build

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          if (event.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(Dimensions.radiusLg)),
              child: CachedNetworkImage(
                imageUrl: event.imageUrl,
                width: _kThumbnailSize,
                height: _kThumbnailSize,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.space12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(event.title, style: Theme.of(context).textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  if (event.startDate != null) ...<Widget>[
                    const SizedBox(height: Dimensions.space4),
                    Text(
                      _dateRange(event),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Private methods

  String _dateRange(Event e) {
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
