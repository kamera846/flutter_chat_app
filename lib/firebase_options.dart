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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaM2v29FPiCLgEPMWyVrVd0ht3PUYJ4vg',
    appId: '1:600606233682:android:2015e27870e38cccfc3b8b',
    messagingSenderId: '600606233682',
    projectId: 'my-testing-project-17d76',
    databaseURL: 'https://my-testing-project-17d76-default-rtdb.firebaseio.com',
    storageBucket: 'my-testing-project-17d76.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF3iDBK8HV1q9uVBA-zOwOGgrom2HvEA0',
    appId: '1:600606233682:ios:40a9783d0ac4acd0fc3b8b',
    messagingSenderId: '600606233682',
    projectId: 'my-testing-project-17d76',
    databaseURL: 'https://my-testing-project-17d76-default-rtdb.firebaseio.com',
    storageBucket: 'my-testing-project-17d76.appspot.com',
    iosBundleId: 'com.example.flutterChatApp',
  );

}