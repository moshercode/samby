import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  // Variables

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final Widget child;

  // Constructor

  const AppCard({
    super.key,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(Dimensions.space16),
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.constraints,
    required this.child,
  });

  // Build

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      constraints: constraints,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: borderRadius ?? BorderRadius.circular(Dimensions.radiusLg),
        border: border ?? Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: child,
    );
  }
}
