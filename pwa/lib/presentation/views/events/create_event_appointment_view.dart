import 'package:flutter/material.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/events/create_event_appointment_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class CreateEventAppointmentView extends BaseView<CreateEventAppointmentViewModel> {
  // Constructor

  const CreateEventAppointmentView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      appBar: AppBar(title: Text(l.createAppointmentTitle), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppTextInput(label: l.fieldTitle, onChanged: viewModel.onTitleChanged),
            const SizedBox(height: Dimensions.space12),
            AppTextInput(label: l.fieldDescription, onChanged: viewModel.onDescriptionChanged, maxLines: 3),
            const SizedBox(height: Dimensions.space12),
            _DateField(label: l.createAppointmentDateLabel, date: viewModel.eventDate, onPick: (DateTime d) => viewModel.setEventDate(d)),
            const SizedBox(height: Dimensions.space12),
            _DateField(
              label: l.createEventEndDate,
              date: viewModel.endDate,
              onPick: (DateTime d) => viewModel.setEndDate(d),
              onClear: () => viewModel.setEndDate(null),
            ),
            const SizedBox(height: Dimensions.space24),
            Button(title: l.createAppointmentSubmit, loading: viewModel.isLoading(), onTap: viewModel.isValid ? viewModel.submit : null),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  // Variables

  final String label;
  final DateTime? date;
  final ValueChanged<DateTime> onPick;
  final VoidCallback? onClear;

  // Constructor

  const _DateField({required this.label, required this.date, required this.onPick, this.onClear});

  // Build

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );
        if (picked == null) return;
        final TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(date ?? DateTime.now()));
        final DateTime result = DateTime(picked.year, picked.month, picked.day, time?.hour ?? 0, time?.minute ?? 0);
        onPick(result);
      },
      borderRadius: BorderRadius.circular(Dimensions.radiusMd),
      child: Container(
        height: Dimensions.inputHeight,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                date != null ? _fmt(date!.toLocal()) : label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: date != null ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            if (date != null && onClear != null)
              IconButton(
                icon: const Icon(Icons.clear_rounded),
                iconSize: Dimensions.iconSm,
                onPressed: onClear,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
            else
              Icon(Icons.calendar_today_rounded, size: Dimensions.iconSm, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }

  // Private methods

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} '
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
