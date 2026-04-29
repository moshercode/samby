import 'package:samby/core/utils/log.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  // Variables

  static NavigationManager? _instance;
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>(debugLabel: 'navigation_key');
  bool _isProgrammaticNavigationInProgress = false;

  // Constructor

  NavigationManager._();

  // Static methods

  static NavigationManager getInstance() {
    return _instance ??= NavigationManager._();
  }

  // Public methods

  bool hasValidNavigator() => navigationKey.currentState != null;

  NavigatorState getNavigator() => navigationKey.currentState!;

  bool isProgrammaticNavigationInProgress() => _isProgrammaticNavigationInProgress;

  void beginProgrammaticNavigation() {
    Log.debug('NavigationManager: beginning programmatic navigation');
    _isProgrammaticNavigationInProgress = true;
  }

  void endProgrammaticNavigation() {
    Log.debug('NavigationManager: ending programmatic navigation');
    _isProgrammaticNavigationInProgress = false;
  }
}
