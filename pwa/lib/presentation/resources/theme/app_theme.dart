import 'package:samby/presentation/resources/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color defaultPrimaryColor = Color.fromARGB(255, 207, 207, 207);
  static const Color defaultSecondaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color negativeColor = Color(0xFFE53935);
  static const Color positiveColor = Color(0xFF43A047);
  static const Color informationColor = Color(0xFF1976D2);

  static ThemeData buildTheme({
    required Color primaryColor,
    required Color secondaryColor,
    required bool dark,
  }) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(primaryColor);
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
      primary: secondaryColor,
      brightness: brightness,
    );

    final TextTheme textTheme = TextTheme(
      displayLarge: GoogleFonts.montserrat(fontSize: 57, fontWeight: FontWeight.w800, color: colorScheme.onSurface),
      displayMedium: GoogleFonts.montserrat(fontSize: 45, fontWeight: FontWeight.w800, color: colorScheme.onSurface),
      displaySmall: GoogleFonts.montserrat(fontSize: 36, fontWeight: FontWeight.w800, color: colorScheme.onSurface),
      headlineLarge: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
      headlineMedium: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
      headlineSmall: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
      titleLarge: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      titleMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      titleSmall: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      bodyLarge: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
      bodyMedium: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
      bodySmall: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400, color: colorScheme.onSurfaceVariant),
      labelLarge: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
      labelMedium: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
      labelSmall: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,
      scaffoldBackgroundColor: colorScheme.surfaceContainerHigh,
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimensions.space16,
          vertical: Dimensions.space12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusXs),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusXs),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusXs),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusXs),
          borderSide: const BorderSide(color: negativeColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusXs),
          borderSide: const BorderSide(color: negativeColor, width: 1.5),
        ),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
        floatingLabelStyle: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 12),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          minimumSize: const Size.fromHeight(Dimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusXs)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          minimumSize: const Size.fromHeight(Dimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusXs)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          minimumSize: const Size.fromHeight(Dimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusXs)),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerLow,
          padding: const EdgeInsets.all(Dimensions.space4),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(Dimensions.radiusSm),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.outlineVariant, thickness: 1),
    );
  }
}
