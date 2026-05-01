import 'package:flutter/material.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/members/membership_status_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class MembershipStatusView extends BaseView<MembershipStatusViewModel> {
  // Constructor

  const MembershipStatusView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    if (viewModel.isPending) return _buildPending(context, l);
    if (viewModel.isBlocked) return _buildBlocked(context, l);
    return _buildRejected(context, l);
  }

  // Private methods

  Widget _buildPending(BuildContext context, Localization l) {
    return SafeScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.screenMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.hourglass_empty_rounded, size: Dimensions.iconXXXl, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: Dimensions.space24),
              Text(l.membershipStatusPendingTitle, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: Dimensions.space12),
              Text(
                l.membershipStatusPendingMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space32),
              Button(title: l.membershipStatusRefresh, loading: viewModel.isLoading(), onTap: viewModel.checkStatus),
              const SizedBox(height: Dimensions.space12),
              TextButton(onPressed: viewModel.logout, child: Text(l.profileLogout)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRejected(BuildContext context, Localization l) {
    return SafeScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.screenMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.cancel_outlined, size: Dimensions.iconXXXl, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: Dimensions.space24),
              Text(l.membershipStatusRejectedTitle, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: Dimensions.space12),
              Text(
                l.membershipStatusRejectedMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space32),
              if (viewModel.canReapply) Button(title: l.membershipStatusReapply, onTap: viewModel.reapply),
              const SizedBox(height: Dimensions.space12),
              TextButton(onPressed: viewModel.logout, child: Text(l.profileLogout)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlocked(BuildContext context, Localization l) {
    return SafeScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.screenMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.block_rounded, size: Dimensions.iconXXXl, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: Dimensions.space24),
              Text(
                l.membershipStatusBlockedMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space32),
              TextButton(onPressed: viewModel.logout, child: Text(l.profileLogout)),
            ],
          ),
        ),
      ),
    );
  }
}
