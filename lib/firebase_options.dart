// File generated for Firebase configuration.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvHvf2rtZMoCMCgwpM1Okb8IRpxwLw2GM',
    appId: '1:814751435164:web:eddb28a56f73389267e059',
    messagingSenderId: '814751435164',
    projectId: 'portfolio-cddfa',
    authDomain: 'portfolio-cddfa.firebaseapp.com',
    storageBucket: 'portfolio-cddfa.firebasestorage.app',
    measurementId: 'G-ZXFYJ2SET8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvHvf2rtZMoCMCgwpM1Okb8IRpxwLw2GM',
    appId: '1:814751435164:android:eddb28a56f73389267e059',
    messagingSenderId: '814751435164',
    projectId: 'portfolio-cddfa',
    storageBucket: 'portfolio-cddfa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvHvf2rtZMoCMCgwpM1Okb8IRpxwLw2GM',
    appId: '1:814751435164:ios:eddb28a56f73389267e059',
    messagingSenderId: '814751435164',
    projectId: 'portfolio-cddfa',
    storageBucket: 'portfolio-cddfa.firebasestorage.app',
    iosBundleId: 'com.example.portfolioV2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvHvf2rtZMoCMCgwpM1Okb8IRpxwLw2GM',
    appId: '1:814751435164:ios:eddb28a56f73389267e059',
    messagingSenderId: '814751435164',
    projectId: 'portfolio-cddfa',
    storageBucket: 'portfolio-cddfa.firebasestorage.app',
    iosBundleId: 'com.example.portfolioV2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDvHvf2rtZMoCMCgwpM1Okb8IRpxwLw2GM',
    appId: '1:814751435164:web:eddb28a56f73389267e059',
    messagingSenderId: '814751435164',
    projectId: 'portfolio-cddfa',
    authDomain: 'portfolio-cddfa.firebaseapp.com',
    storageBucket: 'portfolio-cddfa.firebasestorage.app',
    measurementId: 'G-ZXFYJ2SET8',
  );
}
