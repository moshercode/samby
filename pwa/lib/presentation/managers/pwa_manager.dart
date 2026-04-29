import 'dart:js_interop';

import 'package:web/web.dart' as web;

extension type _BeforeInstallPromptEvent._(web.Event _) implements web.Event {
  external JSPromise<JSAny?> prompt();
}

final class PwaManager {
  // Constants

  static const String kSource = 'source';
  static const String kSourcePwa = 'pwa';

  // Variables

  static PwaManager? _instance;
  static PwaManager get instance => _instance ??= PwaManager._();
  bool isInstalled = false;
  _BeforeInstallPromptEvent? _installPromptEvent;
  bool get isInstallAvailable => _installPromptEvent != null;

  // Constructor

  PwaManager._();

  // Public methods

  Future<void> init() async {
    final String source = Uri.base.queryParameters[kSource] ?? 'web';
    final bool isStandalone = web.window.matchMedia('(display-mode: standalone)').matches;
    isInstalled = source == kSourcePwa || isStandalone;

    web.window.addEventListener(
      'beforeinstallprompt',
      (web.Event event) {
        event.preventDefault();
        _installPromptEvent = event as _BeforeInstallPromptEvent;
      }.toJS,
    );
  }

  Future<void> triggerInstallPrompt() async {
    if (_installPromptEvent == null) return;
    await _installPromptEvent!.prompt().toDart;
    _installPromptEvent = null;
  }
}
