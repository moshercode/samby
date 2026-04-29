import 'package:samby/core/utils/log.dart';
import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/resources/theme/app_theme.dart';
import 'package:samby/presentation/widgets/common/button.dart';
import 'package:flutter/material.dart';

abstract class DialogUtils {
  // Public methods

  static void showInfoSnackBar({required BuildContext context, required String message}) {
    _showSnackBar(
      context: context,
      backgroundColor: AppTheme.informationColor,
      iconData: Icons.info_outline_rounded,
      textColor: Colors.white,
      message: message,
    );
  }

  static void showSuccessSnackBar({required BuildContext context, required String message}) {
    _showSnackBar(
      context: context,
      backgroundColor: AppTheme.positiveColor,
      iconData: Icons.check_circle_outline_rounded,
      textColor: Colors.white,
      message: message,
    );
  }

  static void showErrorSnackBar({required BuildContext context, required String message}) {
    _showSnackBar(
      context: context,
      backgroundColor: AppTheme.negativeColor,
      iconData: Icons.error_outline_rounded,
      textColor: Colors.white,
      message: message,
    );
  }

  static Future<void> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String confirmLabel,
    required String cancelLabel,
    required VoidCallback onConfirm,
    bool destructive = false,
  }) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(title),
        actions: <Widget>[
          Button.text(title: cancelLabel, onTap: () => Navigator.of(dialogContext).pop(false)),
          Button.text(
            title: confirmLabel,
            color: destructive ? AppTheme.negativeColor : null,
            onTap: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );
    if (confirmed == true) onConfirm();
  }

  static Future<T?> showModal<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radiusXl)),
      ),
      builder: (_) => child,
    );
  }

  // Private methods

  static void _showSnackBar({
    required BuildContext context,
    Color? backgroundColor,
    IconData? iconData,
    Color? textColor,
    required String message,
  }) {
    if (!context.mounted) return;
    final ScaffoldMessengerState? messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger != null) {
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          duration: const Duration(seconds: 3),
          content: Row(
            children: <Widget>[
              Icon(iconData!, size: Dimensions.iconMd, color: textColor),
              const SizedBox(width: Dimensions.space16),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      Log.error('Could not show snackbar, messenger is null');
    }
  }
}
