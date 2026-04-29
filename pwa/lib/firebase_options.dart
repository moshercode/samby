// TODO: Run 'flutterfire configure --project=samby-f3e5b' to generate this file.
// See: https://firebase.google.com/docs/flutter/setup
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError('DefaultFirebaseOptions: unsupported platform.');
  }

  // Replace these values with the output of 'flutterfire configure'.
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'REPLACE_WITH_YOUR_API_KEY',
    appId: 'REPLACE_WITH_YOUR_APP_ID',
    messagingSenderId: 'REPLACE_WITH_YOUR_SENDER_ID',
    projectId: 'samby-f3e5b',
    authDomain: 'samby-f3e5b.firebaseapp.com',
    storageBucket: 'samby-f3e5b.appspot.com',
    measurementId: 'REPLACE_WITH_YOUR_MEASUREMENT_ID',
  );
}
