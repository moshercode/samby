import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/firebase_options.dart';
import 'package:samby/presentation/managers/navigation_manager.dart';
import 'package:samby/presentation/managers/pwa_manager.dart';
import 'package:samby/presentation/managers/samby_theme_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/viewmodels/splash/splash_viewmodel.dart';
import 'package:samby/presentation/views/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    Log.error('$error', stackTrace: stack, fatal: true);
    return true;
  };

  setUrlStrategy(null);
  await initDependencies();
  await PwaManager.instance.init();
  await SambyThemeManager.instance.init();
  await UserManager.instance.init();

  runApp(const SambyApp());
}

class SambyApp extends StatelessWidget {
  const SambyApp({super.key});

  // Build

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: SambyThemeManager.instance,
      builder: (BuildContext context, _) => MaterialApp(
        title: 'Samby',
        debugShowCheckedModeBanner: false,
        scrollBehavior: _NoScrollbarBehavior(),
        theme: SambyThemeManager.instance.getTheme(false),
        localizationsDelegates: Localization.localizationsDelegates,
        supportedLocales: Localization.supportedLocales,
        navigatorKey: NavigationManager.getInstance().navigationKey,
        home: SplashView(SplashViewModel()),
      ),
    );
  }
}

class _NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;
}
