import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/splash/splash_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SplashView extends BaseView<SplashViewModel> {
  // Constructor

  const SplashView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    if (viewModel.error == 'not_found') {
      return _NotFoundBody(l: l);
    }

    return SafeScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (viewModel.band != null) ...<Widget>[
              if (viewModel.band!.logoUrl.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: viewModel.band!.logoUrl,
                  height: 100,
                  placeholder: (_, _) => const SizedBox(height: 100),
                  errorWidget: (_, _, _) => Icon(
                    Icons.groups_rounded,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              else
                Icon(Icons.groups_rounded, size: 100, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: Dimensions.space24),
              Text(
                viewModel.band!.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ] else ...<Widget>[
              const CircularProgressIndicator(),
            ],
            const SizedBox(height: Dimensions.space32),
          ],
        ),
      ),
    );
  }
}

class _NotFoundBody extends StatelessWidget {
  // Variables

  final Localization l;

  // Constructor

  const _NotFoundBody({required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.modalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search_off_rounded, size: Dimensions.iconXXXl, color: Theme.of(context).colorScheme.outline),
              const SizedBox(height: Dimensions.space24),
              Text(l.splashBandNotFound, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: Dimensions.space8),
              Text(l.splashBandNotFoundSubtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
