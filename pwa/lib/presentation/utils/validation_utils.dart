abstract class ValidationUtils {
  // Static methods

  static bool isValidEmail(String value) => RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value);

  static bool isValidPhone(String value) =>
      RegExp(r'^\+?[\d\s\-().]{7,20}$').hasMatch(value) &&
      value.replaceAll(RegExp(r'\D'), '').length >= 7;

  static bool isValidSubdomain(String value) => RegExp(r'^[a-z0-9][a-z0-9\-]{1,61}[a-z0-9]$').hasMatch(value);

  static String toSubdomain(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'[^a-z0-9\-]'), '')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  static bool isMinor(DateTime birthDate) {
    final DateTime now = DateTime.now();
    final int age = now.year - birthDate.year;
    if (age > 18) return false;
    if (age < 18) return true;
    return now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day);
  }
}
