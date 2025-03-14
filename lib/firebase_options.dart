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
    apiKey: 'AIzaSyC6OTLbHCeuseA2Zi2JNlHtMRudy9RNV1o',
    appId: '1:1033461052553:web:9f71562df95e954b464258',
    messagingSenderId: '1033461052553',
    projectId: 'final-project-db32a',
    authDomain: 'final-project-db32a.firebaseapp.com',
    storageBucket: 'final-project-db32a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCC8WG4hJO42pauCx0hUz5AnL5X6EpA8VU',
    appId: '1:1033461052553:android:643e2de6edf3d6ef464258',
    messagingSenderId: '1033461052553',
    projectId: 'final-project-db32a',
    storageBucket: 'final-project-db32a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7kFjBAJMHiyjPub-4J0HFArYwBHn7jh0',
    appId: '1:1033461052553:ios:e9dc539ccf77700c464258',
    messagingSenderId: '1033461052553',
    projectId: 'final-project-db32a',
    storageBucket: 'final-project-db32a.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7kFjBAJMHiyjPub-4J0HFArYwBHn7jh0',
    appId: '1:1033461052553:ios:e9dc539ccf77700c464258',
    messagingSenderId: '1033461052553',
    projectId: 'final-project-db32a',
    storageBucket: 'final-project-db32a.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC6OTLbHCeuseA2Zi2JNlHtMRudy9RNV1o',
    appId: '1:1033461052553:web:cc4617091aa78b16464258',
    messagingSenderId: '1033461052553',
    projectId: 'final-project-db32a',
    authDomain: 'final-project-db32a.firebaseapp.com',
    storageBucket: 'final-project-db32a.firebasestorage.app',
  );
}
