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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBuSgKYYsOXcZkhcQMXqf3YYEGyCDha3JI',
    appId: '1:539120578025:web:f9c92ffc98ae4d66c42f78',
    messagingSenderId: '539120578025',
    projectId: 'samby-f3e5b',
    authDomain: 'samby-f3e5b.firebaseapp.com',
    storageBucket: 'samby-f3e5b.firebasestorage.app',
    measurementId: 'G-F0RFSE9Y8X',
  );

}