// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0EyiBzv-ONPohsBLKjo3Ed_3CSJqnOBU',
    appId: '1:350647957511:web:f072918ecb514a135ed2a2',
    messagingSenderId: '350647957511',
    projectId: 'app-de-estudio-1f24c',
    authDomain: 'app-de-estudio-1f24c.firebaseapp.com',
    storageBucket: 'app-de-estudio-1f24c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD468szyZh8JBzGb0dMzxHgHhS92-QaLLE',
    appId: '1:350647957511:android:600b884390da83605ed2a2',
    messagingSenderId: '350647957511',
    projectId: 'app-de-estudio-1f24c',
    storageBucket: 'app-de-estudio-1f24c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0Sf6hAwAhhdKLXBF1pBy7CHa5uyglC_M',
    appId: '1:350647957511:ios:f0d450239fe6ad175ed2a2',
    messagingSenderId: '350647957511',
    projectId: 'app-de-estudio-1f24c',
    storageBucket: 'app-de-estudio-1f24c.appspot.com',
    iosBundleId: 'com.example.appDeEstudio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0Sf6hAwAhhdKLXBF1pBy7CHa5uyglC_M',
    appId: '1:350647957511:ios:f0d450239fe6ad175ed2a2',
    messagingSenderId: '350647957511',
    projectId: 'app-de-estudio-1f24c',
    storageBucket: 'app-de-estudio-1f24c.appspot.com',
    iosBundleId: 'com.example.appDeEstudio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0EyiBzv-ONPohsBLKjo3Ed_3CSJqnOBU',
    appId: '1:350647957511:web:9455465a19e862725ed2a2',
    messagingSenderId: '350647957511',
    projectId: 'app-de-estudio-1f24c',
    authDomain: 'app-de-estudio-1f24c.firebaseapp.com',
    storageBucket: 'app-de-estudio-1f24c.appspot.com',
  );
}
