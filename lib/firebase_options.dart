
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
    apiKey: 'AIzaSyBcm7Tg34te0mLCATcca6XDCAjsgXTdO_c',
    appId: '1:49044076875:web:45a4dad79407ef5cd850ce',
    messagingSenderId: '49044076875',
    projectId: 'cpmad-p9',
    authDomain: 'cpmad-p9.firebaseapp.com',
    storageBucket: 'cpmad-p9.appspot.com',
    measurementId: 'G-G09Z1GPMHY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM-FQ5sNi8MF1k-2DVEgTNs7Is0r4jxoU',
    appId: '1:49044076875:android:215a694ed1dae716d850ce',
    messagingSenderId: '49044076875',
    projectId: 'cpmad-p9',
    storageBucket: 'cpmad-p9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAquAceispcDRt7BxmZfeWWP1sh83aBQtY',
    appId: '1:49044076875:ios:2f6d06ca2421c375d850ce',
    messagingSenderId: '49044076875',
    projectId: 'cpmad-p9',
    storageBucket: 'cpmad-p9.appspot.com',
    iosBundleId: 'com.example.practical10',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAquAceispcDRt7BxmZfeWWP1sh83aBQtY',
    appId: '1:49044076875:ios:85c872245f518b33d850ce',
    messagingSenderId: '49044076875',
    projectId: 'cpmad-p9',
    storageBucket: 'cpmad-p9.appspot.com',
    iosBundleId: 'com.example.practical10.RunnerTests',
  );
}
