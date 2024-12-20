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
    apiKey: 'AIzaSyD7E0ZHtxisCa3xWhEsKIWo16wFXcBRPoQ',
    appId: '1:84155285478:web:7fe3ee7ef5c52b4db7a027',
    messagingSenderId: '84155285478',
    projectId: 'movie-app-938e9',
    authDomain: 'movie-app-938e9.firebaseapp.com',
    storageBucket: 'movie-app-938e9.firebasestorage.app',
    measurementId: 'G-5XJJ01BQEG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3TtH4Hufw0HUXfw3olUxL8Xggb55_pG4',
    appId: '1:84155285478:android:f636ac57bb2c43cbb7a027',
    messagingSenderId: '84155285478',
    projectId: 'movie-app-938e9',
    storageBucket: 'movie-app-938e9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-XIgzX4vDeF7vrZPDPBcskX34RGGKqNw',
    appId: '1:84155285478:ios:e04b153a05587ff7b7a027',
    messagingSenderId: '84155285478',
    projectId: 'movie-app-938e9',
    storageBucket: 'movie-app-938e9.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-XIgzX4vDeF7vrZPDPBcskX34RGGKqNw',
    appId: '1:84155285478:ios:e04b153a05587ff7b7a027',
    messagingSenderId: '84155285478',
    projectId: 'movie-app-938e9',
    storageBucket: 'movie-app-938e9.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7E0ZHtxisCa3xWhEsKIWo16wFXcBRPoQ',
    appId: '1:84155285478:web:02a4709718651c30b7a027',
    messagingSenderId: '84155285478',
    projectId: 'movie-app-938e9',
    authDomain: 'movie-app-938e9.firebaseapp.com',
    storageBucket: 'movie-app-938e9.firebasestorage.app',
    measurementId: 'G-F3S9BZJBM2',
  );
}
