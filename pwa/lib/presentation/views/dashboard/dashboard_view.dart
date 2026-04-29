import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/dashboard/dashboard_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              viewModel.isManager ? Icons.manage_accounts_rounded : Icons.groups_rounded,
              size: Dimensions.iconXXl,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: Dimensions.space16),
            Text(
              l.dashboardTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: Dimensions.space8),
            Text(
              viewModel.isManager ? 'Modo manager' : 'Modo miembro',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
