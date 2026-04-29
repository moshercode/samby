import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  // Variables

  final IconData? icon;
  final VoidCallback onTap;

  // Constructor

  const AppBackButton({super.key, this.icon, required this.onTap});

  // Build

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(110),
      borderRadius: BorderRadius.circular(Dimensions.radiusLg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimensions.radiusLg),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.space8),
          child: Icon(icon ?? Icons.arrow_back_rounded, color: Colors.white, size: Dimensions.iconLg),
        ),
      ),
    );
  }
}
