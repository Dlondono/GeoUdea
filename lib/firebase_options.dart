// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwr9Ul1rbybA48PyaDhkqWbetf9LKmwCg',
    appId: '1:89398673966:android:1b56679cc172ffad2615bf',
    messagingSenderId: '89398673966',
    projectId: 'geoudea-b2123',
    storageBucket: 'geoudea-b2123.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuvUdSXf_tejBZd348toIw5ZOy3NHV4Tw',
    appId: '1:89398673966:ios:58e6e117be55d9de2615bf',
    messagingSenderId: '89398673966',
    projectId: 'geoudea-b2123',
    storageBucket: 'geoudea-b2123.appspot.com',
    iosClientId: '89398673966-eu5h0hdatnb1ac0rvuu6kbk4ek4qjaq2.apps.googleusercontent.com',
    iosBundleId: 'co.edu.udea.geoudea',
  );
}
