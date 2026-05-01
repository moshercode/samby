import 'package:flutter/material.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/members/members_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_card.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class MembersView extends BaseView<MembersViewModel> {

  // Constructor

  const MembersView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);
    return SafeScaffold(
      appBar: AppBar(title: Text(l.membersTitle), centerTitle: false),
      body: viewModel.isLoading()
          ? const Center(child: CircularProgressIndicator())
          : viewModel.members.isEmpty
              ? _buildEmpty(context, l)
              : _buildList(context, l),
    );
  }

  // Private methods

  Widget _buildEmpty(BuildContext context, Localization l) {
    return Center(
      child: Text(
        l.membersEmpty,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, Localization l) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimensions.screenMargin),
      itemCount: viewModel.members.length,
      separatorBuilder: (_, __) => const SizedBox(height: Dimensions.space8),
      itemBuilder: (_, int i) => _MemberCard(
        member: viewModel.members[i],
        l: l,
        onTap: () => NavigationUtils.showMemberDetailView(viewModel, viewModel.members[i]),
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {

  // Variables

  final Member member;
  final Localization l;
  final VoidCallback onTap;

  // Constructor

  const _MemberCard({required this.member, required this.l, required this.onTap});

  // Build

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    member.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                if (member.isBlocked)
                  _Badge(
                    label: l.memberBlocked,
                    color: Theme.of(context).colorScheme.error,
                    textColor: Theme.of(context).colorScheme.onError,
                  ),
              ],
            ),
            const SizedBox(height: Dimensions.space4),
            Text(
              member.email,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: Dimensions.space8),
            Row(
              children: <Widget>[
                _Badge(
                  label: _roleName(member.role),
                  color: member.role == MemberRole.manager
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  textColor: member.role == MemberRole.manager
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: Dimensions.space8),
                _Badge(
                  label: _statusName(member.status),
                  color: _statusColor(context, member.status),
                  textColor: Theme.of(context).colorScheme.onError,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Private methods

  String _roleName(MemberRole role) => switch (role) {
        MemberRole.manager => l.memberRoleManager,
        MemberRole.member => l.memberRoleMember,
      };

  String _statusName(MemberStatus status) => switch (status) {
        MemberStatus.pending => l.memberStatusPending,
        MemberStatus.approved => l.memberStatusApproved,
        MemberStatus.rejected => l.memberStatusRejected,
      };

  Color _statusColor(BuildContext context, MemberStatus status) => switch (status) {
        MemberStatus.pending => Colors.orange.shade600,
        MemberStatus.approved => Colors.green.shade600,
        MemberStatus.rejected => Theme.of(context).colorScheme.error,
      };
}

class _Badge extends StatelessWidget {

  // Variables

  final String label;
  final Color color;
  final Color textColor;

  // Constructor

  const _Badge({required this.label, required this.color, required this.textColor});

  // Build

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.space8,
        vertical: Dimensions.space2,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.radiusSm),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor),
      ),
    );
  }
}
