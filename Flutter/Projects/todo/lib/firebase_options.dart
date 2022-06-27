// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCcxT06CvzO6KspPA36eMR_Tk6K_A_gDZE',
    appId: '1:1060967056091:web:1dd91ab0f7594e2c7202fe',
    messagingSenderId: '1060967056091',
    projectId: 'todo-16b8f',
    authDomain: 'todo-16b8f.firebaseapp.com',
    storageBucket: 'todo-16b8f.appspot.com',
    measurementId: 'G-9SSN6RR6JV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQm3gnFUhlwxIWE61otff9hHzvcmARym8',
    appId: '1:1060967056091:android:0e9c801fffc5feb07202fe',
    messagingSenderId: '1060967056091',
    projectId: 'todo-16b8f',
    storageBucket: 'todo-16b8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc5pBZ_-NCRlozqFfHFL5-GzpY_9r_mTM',
    appId: '1:1060967056091:ios:728141fd4a5e1bfe7202fe',
    messagingSenderId: '1060967056091',
    projectId: 'todo-16b8f',
    storageBucket: 'todo-16b8f.appspot.com',
    iosClientId: '1060967056091-355b9iju48g87n8qg96qjklpdbnq1b3p.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc5pBZ_-NCRlozqFfHFL5-GzpY_9r_mTM',
    appId: '1:1060967056091:ios:728141fd4a5e1bfe7202fe',
    messagingSenderId: '1060967056091',
    projectId: 'todo-16b8f',
    storageBucket: 'todo-16b8f.appspot.com',
    iosClientId: '1060967056091-355b9iju48g87n8qg96qjklpdbnq1b3p.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
