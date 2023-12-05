// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBpYbIaMsFSQjP1kZGVXlxNS7-N7d2T2DE',
    appId: '1:45320307637:web:8d5c1a44c1c26c9f39cffc',
    messagingSenderId: '45320307637',
    projectId: 'magveto-web',
    authDomain: 'magveto-web.firebaseapp.com',
    storageBucket: 'magveto-web.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDArWJo3foieujzxINpQ1DXXPPcjO_XAzg',
    appId: '1:45320307637:android:c7521d886c8e8d7439cffc',
    messagingSenderId: '45320307637',
    projectId: 'magveto-web',
    storageBucket: 'magveto-web.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAAASTsnOzJtxqr1LGUW4kUHS6MCJ2SL4',
    appId: '1:45320307637:ios:aa221dbb411cb52339cffc',
    messagingSenderId: '45320307637',
    projectId: 'magveto-web',
    storageBucket: 'magveto-web.appspot.com',
    iosBundleId: 'com.example.magveto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAAASTsnOzJtxqr1LGUW4kUHS6MCJ2SL4',
    appId: '1:45320307637:ios:5a0effdaf92bfea139cffc',
    messagingSenderId: '45320307637',
    projectId: 'magveto-web',
    storageBucket: 'magveto-web.appspot.com',
    iosBundleId: 'com.example.magveto.RunnerTests',
  );
}