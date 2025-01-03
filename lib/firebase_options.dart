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
    apiKey: 'AIzaSyC3ErB0-Hv-AdP1nae3rsUWtWXdHqM3p-I',
    appId: '1:149072942817:web:67612d64677d3327cc09a0',
    messagingSenderId: '149072942817',
    projectId: 'chat-app-fe139',
    authDomain: 'chat-app-fe139.firebaseapp.com',
    storageBucket: 'chat-app-fe139.firebasestorage.app',
    measurementId: 'G-5B86Q5MC1F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCoogvAdfBwn2S_qBVnD1LinZ7PS9vxMg',
    appId: '1:149072942817:android:810858a3df99a857cc09a0',
    messagingSenderId: '149072942817',
    projectId: 'chat-app-fe139',
    storageBucket: 'chat-app-fe139.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDZXIJ2ZLjMbT2m_zLwf4ymzcJO7XCwVc',
    appId: '1:149072942817:ios:9c997f4bdcf6bbc0cc09a0',
    messagingSenderId: '149072942817',
    projectId: 'chat-app-fe139',
    storageBucket: 'chat-app-fe139.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDZXIJ2ZLjMbT2m_zLwf4ymzcJO7XCwVc',
    appId: '1:149072942817:ios:9c997f4bdcf6bbc0cc09a0',
    messagingSenderId: '149072942817',
    projectId: 'chat-app-fe139',
    storageBucket: 'chat-app-fe139.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3ErB0-Hv-AdP1nae3rsUWtWXdHqM3p-I',
    appId: '1:149072942817:web:14037e46585b992ccc09a0',
    messagingSenderId: '149072942817',
    projectId: 'chat-app-fe139',
    authDomain: 'chat-app-fe139.firebaseapp.com',
    storageBucket: 'chat-app-fe139.firebasestorage.app',
    measurementId: 'G-57L9RBJMPK',
  );
}
