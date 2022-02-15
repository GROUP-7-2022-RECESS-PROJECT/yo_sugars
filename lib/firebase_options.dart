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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCHreL7BkBO9-2CGT0oInmT9HLMyxRox3c',
    appId: '1:320933810352:web:f1d9bda172113c4d75ab75',
    messagingSenderId: '320933810352',
    projectId: 'yo-sugars',
    authDomain: 'yo-sugars.firebaseapp.com',
    storageBucket: 'yo-sugars.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmAOdIxmrp8SZ9NfhTQbRyiWLlWhjNRTo',
    appId: '1:320933810352:android:8ce1fbb24451225e75ab75',
    messagingSenderId: '320933810352',
    projectId: 'yo-sugars',
    storageBucket: 'yo-sugars.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk-1Tr-QAEf-6QqVputfzAmWahZI2sU6A',
    appId: '1:320933810352:ios:b5012b044ced292375ab75',
    messagingSenderId: '320933810352',
    projectId: 'yo-sugars',
    storageBucket: 'yo-sugars.appspot.com',
    iosClientId: '320933810352-aaucgp17l2bre5l8rmiuf6kpibsclu7e.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
