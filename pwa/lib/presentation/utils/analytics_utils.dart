import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:samby/core/utils/log.dart';

abstract class AnalyticsUtils {
  // Constants

  static const String kSambyPwaError = 'samby-pwa-error';

  // Public methods

  static void logScreenView(String screenName, String className) {
    unawaited(FirebaseAnalytics.instance.logScreenView(screenName: screenName, screenClass: className));
  }

  static Future<void> logEvent(String event, {Map<String, Object>? parameters}) async {
    Log.debug('AnalyticsUtils.logEvent: $event, params: $parameters');
    unawaited(FirebaseAnalytics.instance.logEvent(name: event, parameters: parameters ?? <String, Object>{}));
  }
}
