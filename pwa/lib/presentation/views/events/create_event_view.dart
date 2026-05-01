import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/events/create_event_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class CreateEventView extends BaseView<CreateEventViewModel> {
  // Constructor

  const CreateEventView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      appBar: AppBar(title: Text(l.createEventTitle), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppTextInput(label: l.fieldTitle, textInputAction: TextInputAction.next, onChanged: viewModel.onTitleChanged),
              const SizedBox(height: Dimensions.space12),
              AppTextInput(
                label: l.fieldDescription,
                maxLines: 3,
                textInputAction: TextInputAction.newline,
                onChanged: viewModel.onDescriptionChanged,
              ),
              const SizedBox(height: Dimensions.space16),
              Text(l.createEventImageLabel, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: Dimensions.space8),
              _ImagePicker(viewModel: viewModel, l: l),
              const SizedBox(height: Dimensions.space16),
              Text(l.createEventStartDate, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: Dimensions.space8),
              _DateButton(date: viewModel.startDate, onPick: viewModel.setStartDate),
              const SizedBox(height: Dimensions.space12),
              Text(l.createEventEndDate, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: Dimensions.space8),
              _DateButton(
                date: viewModel.endDate,
                onPick: viewModel.setEndDate,
                onClear: viewModel.endDate != null ? () => viewModel.setEndDate(null) : null,
                clearLabel: l.clearDate,
              ),
              const SizedBox(height: Dimensions.space24),
              SwitchListTile(
                title: Text(l.createEventFreeEntry),
                value: viewModel.freeEntry,
                onChanged: viewModel.setFreeEntry,
                contentPadding: EdgeInsets.zero,
              ),
              if (!viewModel.freeEntry) ...<Widget>[
                const SizedBox(height: Dimensions.space8),
                AppTextInput(label: l.createEventEntryCondition, maxLines: 2, onChanged: viewModel.onEntryConditionChanged),
              ],
              const SizedBox(height: Dimensions.space32),
              Button(title: l.createEventSubmit, loading: viewModel.isLoading(), onTap: viewModel.isValid ? viewModel.submit : null),
              const SizedBox(height: Dimensions.space24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImagePicker extends StatelessWidget {
  // Constants

  static const double _kImagePreviewHeight = 160;

  // Variables

  final CreateEventViewModel viewModel;
  final Localization l;

  // Constructor

  const _ImagePicker({required this.viewModel, required this.l});

  // Build

  @override
  Widget build(BuildContext context) {
    if (viewModel.imageUrl != null) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
            child: CachedNetworkImage(
              imageUrl: viewModel.imageUrl!,
              height: _kImagePreviewHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: Dimensions.space8,
            right: Dimensions.space8,
            child: GestureDetector(
              onTap: viewModel.pickAndUploadImage,
              child: Container(
                padding: const EdgeInsets.all(Dimensions.space8),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(Dimensions.radiusSm)),
                child: const Icon(Icons.edit_rounded, size: Dimensions.iconMd),
              ),
            ),
          ),
        ],
      );
    }

    return Button.outlined(
      title: l.createEventImageLabel,
      icon: Icons.upload_rounded,
      loading: viewModel.isImageUploading,
      onTap: viewModel.pickAndUploadImage,
    );
  }
}

class _DateButton extends StatelessWidget {
  // Variables

  final DateTime? date;
  final void Function(DateTime) onPick;
  final VoidCallback? onClear;
  final String? clearLabel;

  // Constructor

  const _DateButton({required this.date, required this.onPick, this.onClear, this.clearLabel});

  // Build

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: date ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) onPick(picked);
            },
            icon: const Icon(Icons.calendar_today_rounded, size: Dimensions.iconMd),
            label: Text(date != null ? _fmt(date!) : '—'),
          ),
        ),
        if (onClear != null) ...<Widget>[
          const SizedBox(width: Dimensions.space8),
          IconButton(onPressed: onClear, icon: const Icon(Icons.close_rounded), tooltip: clearLabel),
        ],
      ],
    );
  }

  // Private methods

  String _fmt(DateTime d) {
    final DateTime local = d.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}/'
        '${local.year}';
  }
}
