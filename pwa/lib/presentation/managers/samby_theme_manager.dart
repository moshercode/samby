import 'package:samby/presentation/resources/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SambyThemeManager with ChangeNotifier {
  // Constants

  static const String kKeyPrimaryColor = 'primary_color_hex';
  static const String kKeySecondaryColor = 'secondary_color_hex';

  // Variables

  static SambyThemeManager? _instance;
  static SambyThemeManager get instance => _instance ??= SambyThemeManager._();
  late SharedPreferences _preferences;
  Color? primaryColor;
  Color? secondaryColor;

  // Constructor

  SambyThemeManager._();

  // Public methods

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    final String? primaryHex = _preferences.get(kKeyPrimaryColor) as String?;
    if (primaryHex != null) primaryColor = _hexToColor(primaryHex);
    final String? secondaryHex = _preferences.get(kKeySecondaryColor) as String?;
    if (secondaryHex != null) secondaryColor = _hexToColor(secondaryHex);
  }

  Future<void> setThemeColors(String primaryHex, String secondaryHex) async {
    final Color newPrimary = _hexToColor(primaryHex);
    final Color newSecondary = _hexToColor(secondaryHex);
    await _preferences.setString(kKeyPrimaryColor, primaryHex);
    await _preferences.setString(kKeySecondaryColor, secondaryHex);
    if (newPrimary != primaryColor || newSecondary != secondaryColor) {
      primaryColor = newPrimary;
      secondaryColor = newSecondary;
      notifyListeners();
    }
  }

  Future<void> resetTheme() async {
    await _preferences.remove(kKeyPrimaryColor);
    await _preferences.remove(kKeySecondaryColor);
    primaryColor = null;
    secondaryColor = null;
    notifyListeners();
  }

  ThemeData getTheme(bool dark) {
    return AppTheme.buildTheme(
      primaryColor: primaryColor ?? AppTheme.defaultPrimaryColor,
      secondaryColor: secondaryColor ?? AppTheme.defaultSecondaryColor,
      dark: dark,
    );
  }

  // Private methods

  Color _hexToColor(String hex) {
    String h = hex.replaceAll('#', '');
    if (h.length == 6) h = 'FF$h';
    return Color(int.parse(h, radix: 16));
  }
}
