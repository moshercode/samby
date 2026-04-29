import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/access_request/access_request_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';
import 'package:samby/presentation/resources/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AccessRequestView extends BaseView<AccessRequestViewModel> {
  // Constructor

  const AccessRequestView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: Dimensions.space16),
              Text(l.accessRequestTitle, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: Dimensions.space4),
              Text(l.accessRequestSubtitle, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: Dimensions.space32),

              // Block 1 — Personal details
              _Block1PersonalDetails(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              // Block 2 — Conditions
              _Block2Conditions(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              // Block 3 — Signature
              _Block3Signature(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              Button(
                title: l.accessRequestSubmit,
                loading: viewModel.isLoading(),
                onTap: viewModel.isReadyToSubmit ? viewModel.submit : null,
              ),
              const SizedBox(height: Dimensions.space32),
            ],
          ),
        ),
      ),
    );
  }
}

class _Block1PersonalDetails extends StatelessWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _Block1PersonalDetails({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(l.accessRequestBlock1Title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space12),
        AppTextInput(
          label: l.accessRequestFullName,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          onChanged: viewModel.onNameChanged,
        ),
        const SizedBox(height: Dimensions.space12),
        AppTextInput(
          label: l.accessRequestBirthDate,
          hint: l.accessRequestBirthDateHint,
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          onChanged: viewModel.onBirthDateChanged,
        ),
        const SizedBox(height: Dimensions.space12),
        AppTextInput(
          label: l.accessRequestDNI,
          textInputAction: TextInputAction.next,
          onChanged: viewModel.onDNIChanged,
        ),
        const SizedBox(height: Dimensions.space12),
        Button.outlined(
          title: viewModel.memberDNIImageUrl != null ? l.accessRequestDNIUploaded : l.accessRequestUploadDNI,
          icon: viewModel.memberDNIImageUrl != null ? Icons.check_circle_outline_rounded : Icons.upload_rounded,
          onTap: () {
            // TODO: open ImagePicker.pickImage(source: ImageSource.gallery/camera)
            // Upload result to Firebase Storage and call viewModel.onDNIImageUploaded(url)
          },
        ),
        if (viewModel.isMinor) ...<Widget>[
          const SizedBox(height: Dimensions.space16),
          Container(
            padding: const EdgeInsets.all(Dimensions.space12),
            decoration: BoxDecoration(
              color: AppTheme.informationColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            ),
            child: Text(l.accessRequestMinorWarning, style: Theme.of(context).textTheme.bodySmall),
          ),
          const SizedBox(height: Dimensions.space16),
          Text(l.accessRequestGuardianTitle, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: Dimensions.space12),
          AppTextInput(
            label: l.accessRequestGuardianFullName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onChanged: viewModel.onGuardianNameChanged,
          ),
          const SizedBox(height: Dimensions.space12),
          AppTextInput(
            label: l.accessRequestGuardianDNI,
            textInputAction: TextInputAction.next,
            onChanged: viewModel.onGuardianDNIChanged,
          ),
          const SizedBox(height: Dimensions.space12),
          Button.outlined(
            title: viewModel.guardianDNIImageUrl != null ? l.accessRequestDNIUploaded : l.accessRequestUploadGuardianDNI,
            icon: viewModel.guardianDNIImageUrl != null ? Icons.check_circle_outline_rounded : Icons.upload_rounded,
            onTap: () {
              // TODO: open ImagePicker.pickImage(source: ImageSource.gallery/camera)
              // Upload result to Firebase Storage and call viewModel.onGuardianDNIImageUploaded(url)
            },
          ),
        ],
      ],
    );
  }
}

class _Block2Conditions extends StatelessWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _Block2Conditions({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    if (viewModel.generalConditions.isEmpty && (!viewModel.isMinor || viewModel.minorConditions.isEmpty)) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(l.accessRequestBlock2Title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space12),
        if (viewModel.generalConditions.isNotEmpty) ...<Widget>[
          ...viewModel.generalConditions.map(
            (String c) => Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space8),
              child: Text('• $c', style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          CheckboxListTile(
            value: viewModel.allGeneralConditionsAccepted,
            onChanged: (bool? v) => viewModel.allGeneralConditionsAccepted = v ?? false,
            title: const Text('Acepto las condiciones generales'),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
        if (viewModel.isMinor && viewModel.minorConditions.isNotEmpty) ...<Widget>[
          const SizedBox(height: Dimensions.space12),
          ...viewModel.minorConditions.map(
            (String c) => Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space8),
              child: Text('• $c', style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          CheckboxListTile(
            value: viewModel.allMinorConditionsAccepted,
            onChanged: (bool? v) => viewModel.allMinorConditionsAccepted = v ?? false,
            title: const Text('Acepto las condiciones para menores'),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ],
    );
  }
}

class _Block3Signature extends StatefulWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _Block3Signature({required this.viewModel, required this.l});

  // Build

  @override
  State<_Block3Signature> createState() => _Block3SignatureState();
}

class _Block3SignatureState extends State<_Block3Signature> {
  // Variables

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    exportBackgroundColor: Colors.white,
  );

  // Life cycle

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.l.accessRequestBlock3Title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Dimensions.space8),
        Text(widget.l.accessRequestSignatureHint, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: Dimensions.space12),
        Container(
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            child: Signature(controller: _signatureController, backgroundColor: Colors.white),
          ),
        ),
        const SizedBox(height: Dimensions.space8),
        Button.text(
          title: widget.l.accessRequestClearSignature,
          icon: Icons.refresh_rounded,
          onTap: () {
            _signatureController.clear();
            widget.viewModel.onSignatureUploaded('');
          },
        ),
        // TODO: listen to _signatureController changes (addListener) and, on each stroke end,
        // call _signatureController.toPngBytes() → upload PNG to Firebase Storage path:
        //   memberships/{associationId}/{userId}/signature/signature.png
        // → call widget.viewModel.onSignatureUploaded(downloadUrl)
        // Do this in initState/dispose lifecycle of _Block3SignatureState
      ],
    );
  }
}
