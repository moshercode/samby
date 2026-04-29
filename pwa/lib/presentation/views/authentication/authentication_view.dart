import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/feature/authentication/auth_error_banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends BaseView<AuthenticationViewModel> {
  // Constructor

  const AuthenticationView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);
    final String? logoUrl = SessionDataManager.instance.association?.logoUrl;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.screenMargin),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: Dimensions.space40),
                if (logoUrl != null && logoUrl.isNotEmpty)
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: logoUrl,
                      height: 80,
                      placeholder: (_, _) => const SizedBox(height: 80),
                      errorWidget: (_, _, _) => Icon(Icons.groups_rounded, size: 80, color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                else
                  Center(child: Icon(Icons.groups_rounded, size: 80, color: Theme.of(context).colorScheme.primary)),
                const SizedBox(height: Dimensions.space24),
                Text(
                  viewModel.isLoginMode ? l.authLoginTitle : l.authRegisterTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.space4),
                Text(
                  viewModel.isLoginMode ? l.authLoginSubtitle : l.authRegisterSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.space24),
                if (!viewModel.isLoginMode) ...<Widget>[
                  AppTextInput(
                    label: l.authFullName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (v) => viewModel.fullName = v,
                  ),
                  const SizedBox(height: Dimensions.space12),
                ],
                AppTextInput(
                  label: l.authEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (v) => viewModel.email = v,
                ),
                const SizedBox(height: Dimensions.space12),
                if (!viewModel.passwordResetSent) ...<Widget>[
                  AppTextInput(
                    label: l.authPassword,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onChanged: (v) => viewModel.password = v,
                    onSubmitted: (_) => viewModel.isLoginMode ? viewModel.login() : viewModel.register(),
                  ),
                  const SizedBox(height: Dimensions.space16),
                ],
                if (viewModel.error != null) ...<Widget>[
                  AuthErrorBanner(error: viewModel.error!),
                  const SizedBox(height: Dimensions.space16),
                ],
                if (viewModel.passwordResetSent) ...<Widget>[
                  Text(l.passwordResetSentConfirmation, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                  const SizedBox(height: Dimensions.space16),
                  Button.text(title: l.passwordResetBack, onTap: viewModel.toggleMode),
                ] else if (viewModel.isLoginMode) ...<Widget>[
                  Button(
                    title: l.authLoginSubmit,
                    loading: viewModel.isLoading(),
                    onTap: viewModel.isLoginEnabled ? viewModel.login : null,
                  ),
                  const SizedBox(height: Dimensions.space12),
                  Button.text(title: l.authForgotPassword, onTap: viewModel.sendPasswordReset),
                  Button.text(title: l.authSwitchToRegister, onTap: viewModel.toggleMode),
                ] else ...<Widget>[
                  Button(
                    title: l.authRegisterSubmit,
                    loading: viewModel.isLoading(),
                    onTap: viewModel.isRegisterEnabled ? viewModel.register : null,
                  ),
                  const SizedBox(height: Dimensions.space12),
                  Button.text(title: l.authSwitchToLogin, onTap: viewModel.toggleMode),
                ],
                const SizedBox(height: Dimensions.space40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
