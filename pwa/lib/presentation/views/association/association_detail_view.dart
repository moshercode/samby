import 'package:flutter/material.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/association/association_detail_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class BandDetailView extends BaseView<BandDetailViewModel> {
  // Constructor

  const BandDetailView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      appBar: AppBar(title: Text(l.bandDetailTitle), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(viewModel.band?.name ?? '', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: Dimensions.space4),
            Text(
              viewModel.band?.subdomain ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: Dimensions.space32),
            Text(l.bandDetailRequirements, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: Dimensions.space12),
            SwitchListTile(
              title: Text(l.bandDetailRequireIdDoc),
              value: viewModel.requireIdDoc,
              onChanged: (bool v) => viewModel.requireIdDoc = v,
              contentPadding: EdgeInsets.zero,
            ),
            SwitchListTile(
              title: Text(l.bandDetailRequireIdDocImage),
              value: viewModel.requireIdDocImage,
              onChanged: viewModel.requireIdDoc ? (bool v) => viewModel.requireIdDocImage = v : null,
              contentPadding: EdgeInsets.zero,
            ),
            SwitchListTile(
              title: Text(l.bandDetailRequireGuardian),
              value: viewModel.requireGuardian,
              onChanged: (bool v) => viewModel.requireGuardian = v,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: Dimensions.space24),
            Button(title: l.save, loading: viewModel.isLoading(), onTap: viewModel.save),
          ],
        ),
      ),
    );
  }
}
