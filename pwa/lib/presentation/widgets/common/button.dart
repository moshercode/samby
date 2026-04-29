import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, text }

// ignore: must_be_immutable
class Button extends StatelessWidget {
  // Variables

  late ButtonType type;
  final IconData? icon;
  final String? title;
  Color? color;
  final bool dense;
  final bool fillWidth;
  final bool loading;
  final Function? onTap;

  // Constructor

  Button({super.key, this.title, this.icon, this.color, this.loading = false, this.dense = false, this.fillWidth = true, this.onTap}) {
    type = ButtonType.filled;
  }

  Button.outlined({
    super.key,
    this.title,
    this.icon,
    this.color,
    this.loading = false,
    this.dense = false,
    this.fillWidth = true,
    required this.onTap,
  }) {
    type = ButtonType.outlined;
  }

  Button.text({
    super.key,
    this.title,
    this.icon,
    this.color,
    this.loading = false,
    this.dense = false,
    this.fillWidth = false,
    required this.onTap,
  }) {
    type = ButtonType.text;
  }

  // Build

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.filled:
        color ??= Theme.of(context).colorScheme.primary;
        return FilledButton(
          onPressed: onTap != null && !loading ? () => onTap!() : null,
          style: FilledButton.styleFrom(
            minimumSize: Size(0, dense ? Dimensions.buttonHeightDense : Dimensions.buttonHeight),
            backgroundColor: onTap != null ? color! : color!.withValues(alpha: 0.3),
          ),
          child: _content(context, Theme.of(context).colorScheme.onPrimary),
        );
      case ButtonType.outlined:
        color ??= Theme.of(context).colorScheme.primary;
        return OutlinedButton(
          onPressed: onTap != null && !loading ? () => onTap!() : null,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(0, dense ? Dimensions.buttonHeightDense : Dimensions.buttonHeight),
            foregroundColor: onTap != null ? color! : color!.withValues(alpha: 0.3),
            side: BorderSide(color: onTap != null ? color! : color!.withValues(alpha: 0.3)),
          ),
          child: _content(context, color!),
        );
      case ButtonType.text:
        color ??= Theme.of(context).colorScheme.onSurface;
        return TextButton(
          onPressed: onTap != null && !loading ? () => onTap!() : null,
          style: TextButton.styleFrom(
            minimumSize: Size(0, dense ? Dimensions.buttonHeightDense : Dimensions.buttonHeight),
            foregroundColor: onTap != null ? color! : color!.withValues(alpha: 0.3),
          ),
          child: _content(context, color!),
        );
    }
  }

  // Private methods

  Widget _content(BuildContext context, Color textColor) {
    return Row(
      mainAxisSize: fillWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimensions.space12,
      children: <Widget>[
        if (loading)
          SizedBox(
            height: Dimensions.iconMd,
            width: Dimensions.iconMd,
            child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
          )
        else if (icon != null)
          Icon(icon!, size: Dimensions.iconMd),
        if (title != null)
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title!.toUpperCase(),
                maxLines: 1,
                style: (dense
                        ? Theme.of(context).textTheme.labelSmall!
                        : Theme.of(context).textTheme.titleSmall!)
                    .copyWith(color: textColor),
              ),
            ),
          ),
      ],
    );
  }
}
