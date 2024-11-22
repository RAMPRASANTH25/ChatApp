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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDapUFteZ8_08RcGvOecBzISNhHjt_AGmg',
    appId: '1:1051815861403:web:769b88bb90285ec1be3a3e',
    messagingSenderId: '1051815861403',
    projectId: 'chatapp-58f13',
    authDomain: 'chatapp-58f13.firebaseapp.com',
    storageBucket: 'chatapp-58f13.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClZFPrEwxJg_kq4m488BJbKgUueOLSp4w',
    appId: '1:1051815861403:android:80c9a30ee512fe80be3a3e',
    messagingSenderId: '1051815861403',
    projectId: 'chatapp-58f13',
    storageBucket: 'chatapp-58f13.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDapUFteZ8_08RcGvOecBzISNhHjt_AGmg',
    appId: '1:1051815861403:web:7168a54f6630f77ebe3a3e',
    messagingSenderId: '1051815861403',
    projectId: 'chatapp-58f13',
    authDomain: 'chatapp-58f13.firebaseapp.com',
    storageBucket: 'chatapp-58f13.firebasestorage.app',
  );

}