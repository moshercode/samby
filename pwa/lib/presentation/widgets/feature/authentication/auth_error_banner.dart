import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:samby/presentation/resources/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthErrorBanner extends StatelessWidget {
  // Variables

  final String error;

  // Constructor

  const AuthErrorBanner({super.key, required this.error});

  // Build

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.space12),
      decoration: BoxDecoration(
        color: AppTheme.negativeColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimensions.radiusMd),
        border: Border.all(color: AppTheme.negativeColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.error_outline_rounded, size: Dimensions.iconMd, color: AppTheme.negativeColor),
          const SizedBox(width: Dimensions.space8),
          Expanded(
            child: Text(
              error,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.negativeColor),
            ),
          ),
        ],
      ),
    );
  }
}
