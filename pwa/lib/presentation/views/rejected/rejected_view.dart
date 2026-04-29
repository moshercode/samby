import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/resources/theme/app_theme.dart';
import 'package:samby/presentation/viewmodels/rejected/rejected_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:flutter/material.dart';

class RejectedView extends BaseView<RejectedViewModel> {
  // Constructor

  const RejectedView(super.viewModel, {super.key});

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
                Icons.block_rounded,
                size: Dimensions.iconXXXl,
                color: AppTheme.negativeColor,
              ),
              const SizedBox(height: Dimensions.space24),
              Text(
                l.rejectedTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space8),
              Text(
                l.rejectedSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.space16),
              Text(
                viewModel.isBlocked ? l.rejectedBlocked : l.rejectedMessage,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (!viewModel.isBlocked) ...<Widget>[
                const SizedBox(height: Dimensions.space32),
                Button(
                  title: l.rejectedReapply,
                  icon: Icons.refresh_rounded,
                  onTap: viewModel.reapply,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
