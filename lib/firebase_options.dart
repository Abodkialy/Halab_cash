import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC_ai1ENIgsQIxlO0_auQ8lpc5NkvrrFfw',
    appId: '1:885402938682:web:4c3590828df87e75ee7403',
    messagingSenderId: '885402938682',
    projectId: 'halabcash-c04b8',
    authDomain: 'halabcash-c04b8.firebaseapp.com',
    storageBucket: 'halabcash-c04b8.firebasestorage.app',
    measurementId: 'G-Z19R6FVPF7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCLR60qDPNtnbh75Hr4d7NK5DyUnA-Zew',
    appId: '1:885402938682:android:ffdbe6b79a564b03ee7403',
    messagingSenderId: '885402938682',
    projectId: 'halabcash-c04b8',
    storageBucket: 'halabcash-c04b8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmDZMV0eS3IFt5nyW3rsnKAAh7U39nbjE',
    appId: '1:885402938682:ios:bdadd0ab9e4ab7fdee7403',
    messagingSenderId: '885402938682',
    projectId: 'halabcash-c04b8',
    storageBucket: 'halabcash-c04b8.firebasestorage.app',
    iosBundleId: 'com.example.halabCash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmDZMV0eS3IFt5nyW3rsnKAAh7U39nbjE',
    appId: '1:885402938682:ios:bdadd0ab9e4ab7fdee7403',
    messagingSenderId: '885402938682',
    projectId: 'halabcash-c04b8',
    storageBucket: 'halabcash-c04b8.firebasestorage.app',
    iosBundleId: 'com.example.halabCash',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_ai1ENIgsQIxlO0_auQ8lpc5NkvrrFfw',
    appId: '1:885402938682:web:343374d8b8cf10dbee7403',
    messagingSenderId: '885402938682',
    projectId: 'halabcash-c04b8',
    authDomain: 'halabcash-c04b8.firebaseapp.com',
    storageBucket: 'halabcash-c04b8.firebasestorage.app',
    measurementId: 'G-STBNMRH0F5',
  );
}
