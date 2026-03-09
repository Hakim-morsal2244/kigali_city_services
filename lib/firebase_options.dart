// GENERATED CODE - DO NOT MODIFY BY HAND
// Paste this file entirely in lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyXXXXX-YOUR-ANDROID-KEY',
    appId: '1:62661100923:android:2726dde50aac3aa984a9de',
    messagingSenderId: '62661100923',
    projectId: 'kigalicityservice',
    storageBucket: 'kigalicityservice.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyXXXXX-YOUR-MACOS-KEY',
    appId: '1:62661100923:ios:1c6925b37354a2ba84a9de',
    messagingSenderId: '62661100923',
    projectId: 'kigalicityservice',
    storageBucket: 'kigalicityservice.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyXXXXX-YOUR-WINDOWS-KEY',
    appId: '1:62661100923:web:47115fcc24c6e34d84a9de',
    messagingSenderId: '62661100923',
    projectId: 'kigalicityservice',
    storageBucket: 'kigalicityservice.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyXXXXX-YOUR-WEB-KEY',
    appId: '1:62661100923:web:47115fcc24c6e34d84a9de',
    messagingSenderId: '62661100923',
    projectId: 'kigalicityservice',
    storageBucket: 'kigalicityservice.appspot.com',
  );
}