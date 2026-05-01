import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/association/onboarding_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:flutter/material.dart';

class OnboardingView extends BaseView<OnboardingViewModel> {
  // Constructor

  const OnboardingView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.screenMargin),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: Dimensions.space24),
                Icon(Icons.groups_rounded, size: Dimensions.iconXXl, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: Dimensions.space16),
                Text(l.onboardingTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                const SizedBox(height: Dimensions.space4),
                Text(l.onboardingSubtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                const SizedBox(height: Dimensions.space32),

                // Block 1 — Association info
                Text(l.onboardingBlock1Title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Dimensions.space12),
                AppTextInput(label: l.onboardingAssociationName, textInputAction: TextInputAction.next, onChanged: (v) => viewModel.name = v),
                const SizedBox(height: Dimensions.space12),
                AppTextInput(
                  label: l.onboardingAssociationShortName,
                  hint: l.onboardingAssociationShortNameHint,
                  textInputAction: TextInputAction.next,
                  onChanged: (v) => viewModel.shortName = v,
                ),
                const SizedBox(height: Dimensions.space12),
                AppTextInput(
                  label: l.onboardingAssociationSubdomain,
                  hint: l.onboardingAssociationSubdomainHint,
                  initialValue: viewModel.subdomain,
                  textInputAction: TextInputAction.next,
                  onChanged: (v) => viewModel.subdomain = v,
                  errorText: viewModel.subdomainError != null
                      ? (viewModel.subdomainError == 'taken' ? l.onboardingSubdomainTaken : l.onboardingSubdomainInvalid)
                      : null,
                  suffixWidget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space12),
                    child: Align(widthFactor: 1, child: Text('.samby.app', style: Theme.of(context).textTheme.bodySmall)),
                  ),
                ),
                const SizedBox(height: Dimensions.space24),

                // Application requirements
                SwitchListTile(
                  title: Text(l.onboardingRequireIdDoc),
                  value: viewModel.requireIdDoc,
                  onChanged: (bool v) => viewModel.requireIdDoc = v,
                  contentPadding: EdgeInsets.zero,
                ),
                SwitchListTile(
                  title: Text(l.onboardingRequireIdDocImage),
                  value: viewModel.requireIdDocImage,
                  onChanged: viewModel.requireIdDoc ? (bool v) => viewModel.requireIdDocImage = v : null,
                  contentPadding: EdgeInsets.zero,
                ),
                SwitchListTile(
                  title: Text(l.onboardingRequireGuardian),
                  value: viewModel.requireGuardian,
                  onChanged: (bool v) => viewModel.requireGuardian = v,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: Dimensions.space32),

                // Block 2 — General conditions
                _ConditionBlock(
                  title: l.onboardingBlock2Title,
                  conditions: viewModel.generalConditions,
                  addLabel: l.onboardingAddCondition,
                  hint: l.onboardingConditionHint,
                  onAdd: viewModel.addGeneralCondition,
                  onRemove: viewModel.removeGeneralCondition,
                ),
                const SizedBox(height: Dimensions.space24),

                // Block 3 — Minor conditions
                _ConditionBlock(
                  title: l.onboardingBlock3Title,
                  conditions: viewModel.minorConditions,
                  addLabel: l.onboardingAddCondition,
                  hint: l.onboardingConditionHint,
                  onAdd: viewModel.addMinorCondition,
                  onRemove: viewModel.removeMinorCondition,
                ),
                const SizedBox(height: Dimensions.space32),

                Button(title: l.onboardingSubmit, loading: viewModel.isLoading(), onTap: viewModel.isValid ? viewModel.submit : null),
                const SizedBox(height: Dimensions.space24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConditionBlock extends StatefulWidget {
  // Variables

  final String title;
  final List<String> conditions;
  final String addLabel;
  final String hint;
  final void Function(String) onAdd;
  final void Function(int) onRemove;

  // Constructor

  const _ConditionBlock({
    required this.title,
    required this.conditions,
    required this.addLabel,
    required this.hint,
    required this.onAdd,
    required this.onRemove,
  });

  // Build

  @override
  State<_ConditionBlock> createState() => _ConditionBlockState();
}

class _ConditionBlockState extends State<_ConditionBlock> {
  // Variables

  final TextEditingController _controller = TextEditingController();

  // Life cycle

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space12),
        ...widget.conditions.asMap().entries.map(
          (MapEntry<int, String> entry) => Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.space8),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('${entry.key + 1}. ${entry.value}', style: Theme.of(context).textTheme.bodyMedium)),
                IconButton(onPressed: () => widget.onRemove(entry.key), icon: const Icon(Icons.delete_outline_rounded), iconSize: Dimensions.iconMd),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: AppTextInput(label: widget.hint, controller: _controller, maxLines: 2, textInputAction: TextInputAction.done),
            ),
            const SizedBox(width: Dimensions.space8),
            Button.outlined(
              title: '+',
              dense: true,
              fillWidth: false,
              onTap: () {
                widget.onAdd(_controller.text);
                _controller.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}
