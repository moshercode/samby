import 'package:flutter/material.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/viewmodels/create_calendar_event/create_calendar_event_viewmodel.dart';
import 'package:samby/presentation/views/base/base_view.dart';
import 'package:samby/presentation/widgets/common/app_text_input.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:samby/presentation/widgets/common/safe_scaffold.dart';

class CreateCalendarEventView extends BaseView<CreateCalendarEventViewModel> {

  // Constructor

  const CreateCalendarEventView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) {
    final Localization l = Localization.of(context);

    return SafeScaffold(
      appBar: AppBar(title: Text(l.createCalendarEventTitle), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.screenMargin),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppTextInput(
                label: l.fieldTitle,
                textInputAction: TextInputAction.next,
                onChanged: viewModel.onTitleChanged,
              ),
              const SizedBox(height: Dimensions.space12),
              AppTextInput(
                label: l.fieldDescription,
                maxLines: 3,
                textInputAction: TextInputAction.newline,
                onChanged: viewModel.onDescriptionChanged,
              ),
              const SizedBox(height: Dimensions.space16),
              Text(
                l.createCalendarEventDateLabel,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: Dimensions.space8),
              _DateTimeButton(
                dateTime: viewModel.eventDate,
                onPick: viewModel.setEventDate,
              ),
              const SizedBox(height: Dimensions.space12),
              Text(l.createEventEndDate, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: Dimensions.space8),
              _DateTimeButton(
                dateTime: viewModel.endDate,
                onPick: viewModel.setEndDate,
                onClear: viewModel.endDate != null ? () => viewModel.setEndDate(null) : null,
                clearLabel: l.clearDate,
              ),
              const SizedBox(height: Dimensions.space32),
              Button(
                title: l.createCalendarEventSubmit,
                loading: viewModel.isLoading(),
                onTap: viewModel.isValid ? viewModel.submit : null,
              ),
              const SizedBox(height: Dimensions.space24),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateTimeButton extends StatelessWidget {

  // Variables

  final DateTime? dateTime;
  final void Function(DateTime) onPick;
  final VoidCallback? onClear;
  final String? clearLabel;

  // Constructor

  const _DateTimeButton({
    required this.dateTime,
    required this.onPick,
    this.onClear,
    this.clearLabel,
  });

  // Build

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: dateTime ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate == null || !context.mounted) return;
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: dateTime != null
                    ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
                    : TimeOfDay.now(),
              );
              if (pickedTime == null) return;
              onPick(DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              ));
            },
            icon: const Icon(Icons.calendar_today_rounded, size: Dimensions.iconMd),
            label: Text(dateTime != null ? _fmt(dateTime!) : '—'),
          ),
        ),
        if (onClear != null) ...<Widget>[
          const SizedBox(width: Dimensions.space8),
          IconButton(
            onPressed: onClear,
            icon: const Icon(Icons.close_rounded),
            tooltip: clearLabel,
          ),
        ],
      ],
    );
  }

  // Private methods

  String _fmt(DateTime d) {
    final DateTime local = d.toLocal();
    final String date = '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}/'
        '${local.year}';
    final String time = '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
    return '$date  $time';
  }
}
