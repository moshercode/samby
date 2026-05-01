import 'dart:typed_data';

import 'package:samby/domain/entities/association_condition.dart';
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
              _AccessRequestPersonalDetails(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              // Block 2 — Conditions
              _AccessRequestConditions(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              // Block 3 — Signature
              _AccessRequestSignature(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space32),

              Button(title: l.accessRequestSubmit, loading: viewModel.isLoading(), onTap: viewModel.isReadyToSubmit ? viewModel.submit : null),
              const SizedBox(height: Dimensions.space32),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessRequestPersonalDetails extends StatelessWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _AccessRequestPersonalDetails({required this.viewModel, required this.l});

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
        AppTextInput(label: l.accessRequestIdDoc, textInputAction: TextInputAction.next, onChanged: viewModel.onIdDocChanged),
        const SizedBox(height: Dimensions.space12),
        Button.outlined(
          title: viewModel.idDocImageUrl != null ? l.accessRequestIdDocUploaded : l.accessRequestUploadIdDoc,
          icon: viewModel.idDocImageUrl != null ? Icons.check_circle_outline_rounded : Icons.upload_rounded,
          loading: viewModel.isIdDocUploading,
          onTap: () => viewModel.pickAndUploadMemberIdDoc(),
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
          AppTextInput(label: l.accessRequestGuardianIdDoc, textInputAction: TextInputAction.next, onChanged: viewModel.onGuardianIdDocChanged),
          const SizedBox(height: Dimensions.space12),
          Button.outlined(
            title: viewModel.guardianIdDocImageUrl != null ? l.accessRequestIdDocUploaded : l.accessRequestUploadGuardianIdDoc,
            icon: viewModel.guardianIdDocImageUrl != null ? Icons.check_circle_outline_rounded : Icons.upload_rounded,
            loading: viewModel.isGuardianIdDocUploading,
            onTap: () => viewModel.pickAndUploadGuardianIdDoc(),
          ),
        ],
      ],
    );
  }
}

class _AccessRequestConditions extends StatelessWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _AccessRequestConditions({required this.viewModel, required this.l});

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
            (BandCondition c) => Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space8),
              child: Text('• ${c.content}', style: Theme.of(context).textTheme.bodySmall),
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
            (BandCondition c) => Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space8),
              child: Text('• ${c.content}', style: Theme.of(context).textTheme.bodySmall),
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

class _AccessRequestSignature extends StatefulWidget {
  // Variables

  final AccessRequestViewModel viewModel;
  final Localization l;

  // Constructor

  const _AccessRequestSignature({required this.viewModel, required this.l});

  // Build

  @override
  State<_AccessRequestSignature> createState() => _AccessRequestSignatureState();
}

class _AccessRequestSignatureState extends State<_AccessRequestSignature> {
  // Variables

  final SignatureController _signatureController = SignatureController(penStrokeWidth: 2, exportBackgroundColor: Colors.white);
  bool _isUploading = false;

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
            child: Listener(
              onPointerUp: (_) => _onStrokeEnd(),
              child: Signature(controller: _signatureController, backgroundColor: Colors.white),
            ),
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
      ],
    );
  }

  // Private methods

  Future<void> _onStrokeEnd() async {
    if (_isUploading || _signatureController.isEmpty) return;
    _isUploading = true;
    final Uint8List? bytes = await _signatureController.toPngBytes();
    if (bytes != null && mounted) {
      await widget.viewModel.uploadSignature(bytes);
    }
    _isUploading = false;
  }
}
