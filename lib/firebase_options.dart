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
    apiKey: 'AIzaSyBO-rEuIqOHCAVwLPg_Ysy3noj86bsDEgs',
    appId: '1:1061327501849:web:c9da695c95fa0b62968888',
    messagingSenderId: '1061327501849',
    projectId: 'ecommerceapp-eac38',
    authDomain: 'ecommerceapp-eac38.firebaseapp.com',
    storageBucket: 'ecommerceapp-eac38.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbbVFy7xPlJOT3f2jrFD3omQatyoztz90',
    appId: '1:1061327501849:android:4ff540f7f28244bc968888',
    messagingSenderId: '1061327501849',
    projectId: 'ecommerceapp-eac38',
    storageBucket: 'ecommerceapp-eac38.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkWVUNjcv3cHVIttwJtXKZ9tiY3iuvzZg',
    appId: '1:1061327501849:ios:ba4195375af84eb4968888',
    messagingSenderId: '1061327501849',
    projectId: 'ecommerceapp-eac38',
    storageBucket: 'ecommerceapp-eac38.firebasestorage.app',
    androidClientId: '1061327501849-apqhjjhdfc0vfk27pe72viv4a3sa4bvo.apps.googleusercontent.com',
    iosClientId: '1061327501849-v5smqhj4i9fd345i24jb1j7kq72h7a9l.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStoreWebAdimn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkWVUNjcv3cHVIttwJtXKZ9tiY3iuvzZg',
    appId: '1:1061327501849:ios:ba4195375af84eb4968888',
    messagingSenderId: '1061327501849',
    projectId: 'ecommerceapp-eac38',
    storageBucket: 'ecommerceapp-eac38.firebasestorage.app',
    androidClientId: '1061327501849-apqhjjhdfc0vfk27pe72viv4a3sa4bvo.apps.googleusercontent.com',
    iosClientId: '1061327501849-v5smqhj4i9fd345i24jb1j7kq72h7a9l.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStoreWebAdimn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBO-rEuIqOHCAVwLPg_Ysy3noj86bsDEgs',
    appId: '1:1061327501849:web:b10aaa7825cbccdc968888',
    messagingSenderId: '1061327501849',
    projectId: 'ecommerceapp-eac38',
    authDomain: 'ecommerceapp-eac38.firebaseapp.com',
    storageBucket: 'ecommerceapp-eac38.firebasestorage.app',
  );
}
