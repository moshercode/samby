import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextInput extends StatelessWidget {
  // Variables

  final String label;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final Widget? suffixWidget;
  final String? suffixText;
  final Widget? prefixWidget;
  final String? prefixText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? initialValue;
  final String? errorText;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;

  // Constructor

  const AppTextInput({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.suffixWidget,
    this.suffixText,
    this.prefixWidget,
    this.prefixText,
    this.maxLines = 1,
    this.controller,
    this.initialValue,
    this.errorText,
    this.borderColor,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
  });

  // Build

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      inputFormatters: inputFormatters,
      textAlign: textAlign,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffixWidget,
        suffixText: suffixText,
        prefixIcon: prefixWidget,
        prefixText: prefixText,
        errorText: errorText,
        enabledBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusSm),
                borderSide: BorderSide(color: borderColor!, width: 1.5),
              )
            : null,
        focusedBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusSm),
                borderSide: BorderSide(color: borderColor!, width: 1.5),
              )
            : null,
      ),
    );
  }
}
