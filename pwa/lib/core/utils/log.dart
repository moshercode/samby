import 'dart:core';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  // Variables

  static final Logger _logger = Logger(printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart));

  // Static methods

  static void debug(String message) {
    if (kDebugMode) {
      _logger.d(message, stackTrace: _trimmedStackTrace(StackTrace.current));
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      _logger.i(message, stackTrace: _trimmedStackTrace(StackTrace.current));
    }
  }

  static void warning(String message) {
    if (kDebugMode) {
      _logger.w(message, stackTrace: _trimmedStackTrace(StackTrace.current));
    }
  }

  static void error(String message, {StackTrace? stackTrace, bool reportToAnalytics = true, bool fatal = false}) {
    final StackTrace st = stackTrace ?? _trimmedStackTrace(StackTrace.current);
    if (kDebugMode) {
      _logger.e(message, stackTrace: st);
    }
  }

  // Private methods

  static StackTrace _trimmedStackTrace(StackTrace stackTrace) {
    final List<String> items = stackTrace.toString().split('\n');
    final List<String> trimmed = items.length > 1 ? items.sublist(1, min(items.length, 10)) : items;
    return StackTrace.fromString(trimmed.join('\n'));
  }
}
