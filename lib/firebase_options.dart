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
    apiKey: 'AIzaSyAhYHKG6BvxkB0ThFXFQHvqdd4kTpRl1C8',
    appId: '1:345183634297:web:aa21cd332c61239e6e65a8',
    messagingSenderId: '345183634297',
    projectId: 'caflutterdemo',
    authDomain: 'caflutterdemo.firebaseapp.com',
    storageBucket: 'caflutterdemo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOMVh5j9vuKDT9g4xorJCOCOYV2hxoZyc',
    appId: '1:345183634297:android:9b756f41154cf2af6e65a8',
    messagingSenderId: '345183634297',
    projectId: 'caflutterdemo',
    storageBucket: 'caflutterdemo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCupErRReAbcWWeyOzb6jjhyhxHo80b3b8',
    appId: '1:345183634297:ios:d32ff5f51fac69c26e65a8',
    messagingSenderId: '345183634297',
    projectId: 'caflutterdemo',
    storageBucket: 'caflutterdemo.appspot.com',
    iosClientId: '345183634297-muc5t2qp7rq1sp9n2rpkcqe6gqjvr89d.apps.googleusercontent.com',
    iosBundleId: 'com.example.caflutterdemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCupErRReAbcWWeyOzb6jjhyhxHo80b3b8',
    appId: '1:345183634297:ios:d32ff5f51fac69c26e65a8',
    messagingSenderId: '345183634297',
    projectId: 'caflutterdemo',
    storageBucket: 'caflutterdemo.appspot.com',
    iosClientId: '345183634297-muc5t2qp7rq1sp9n2rpkcqe6gqjvr89d.apps.googleusercontent.com',
    iosBundleId: 'com.example.caflutterdemo',
  );
}
