import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/pending_approval/pending_approval_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:flutter/material.dart';

class PendingApprovalView extends BaseView<PendingApprovalViewModel> {
  // Constructor

  const PendingApprovalView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.modalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.hourglass_top_rounded,
                size: Dimensions.iconXXXl,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: Dimensions.space24),
              Text(
                l.pendingTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space8),
              Text(
                l.pendingSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space16),
              Text(
                l.pendingMessage,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
