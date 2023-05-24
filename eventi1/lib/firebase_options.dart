

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
    apiKey: "AIzaSyCAp7I7wGltcRoG8_QRw8-vuWQx_j81inQ",
    authDomain: "eventi-9e670.firebaseapp.com",
    projectId: "eventi-9e670",
    storageBucket: "eventi-9e670.appspot.com",
    messagingSenderId: "201277954423",
    appId: "1:201277954423:web:b240ae8bcff2bf14fde972"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCAp7I7wGltcRoG8_QRw8-vuWQx_j81inQ",
    authDomain: "eventi-9e670.firebaseapp.com",
    projectId: "eventi-9e670",
    storageBucket: "eventi-9e670.appspot.com",
    messagingSenderId: "201277954423",
    appId: "1:201277954423:web:b240ae8bcff2bf14fde972"
  );

  static const FirebaseOptions ios = FirebaseOptions(
     apiKey: "AIzaSyCAp7I7wGltcRoG8_QRw8-vuWQx_j81inQ",
    authDomain: "eventi-9e670.firebaseapp.com",
    projectId: "eventi-9e670",
    storageBucket: "eventi-9e670.appspot.com",
    messagingSenderId: "201277954423",
    appId: "1:201277954423:web:b240ae8bcff2bf14fde972"
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyCAp7I7wGltcRoG8_QRw8-vuWQx_j81inQ",
    authDomain: "eventi-9e670.firebaseapp.com",
    projectId: "eventi-9e670",
    storageBucket: "eventi-9e670.appspot.com",
    messagingSenderId: "201277954423",
    appId: "1:201277954423:web:b240ae8bcff2bf14fde972"
  );

  
}