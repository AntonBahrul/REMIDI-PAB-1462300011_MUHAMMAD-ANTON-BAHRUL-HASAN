import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// TODO: Ganti semua nilai placeholder di bawah dengan konfigurasi Firebase
/// yang kamu dapatkan dari Firebase Console.
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
        return linux;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBhOlTl01py-nXKdp9fmUE4VBL9jjD56uU',
    appId: '1:913279857925:web:46599b47a5b51cd180b36c',
    messagingSenderId: '913279857925',
    projectId: 'remedialpraktikumpab',
    authDomain: 'remedialpraktikumpab.firebaseapp.com',
    storageBucket: 'remedialpraktikumpab.firebasestorage.app',
    measurementId: 'G-29H5LTGQTN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-NYAiUIpBd2jG3574jl-3H9MF9afCloc',
    appId: '1:913279857925:android:8a7a29468f5a070d80b36c',
    messagingSenderId: '913279857925',
    projectId: 'remedialpraktikumpab',
    storageBucket: 'remedialpraktikumpab.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBo45FnNDWM-8TTpsWJZe-JjZlm69peprY',
    appId: '1:913279857925:ios:9f3f03f6b416319c80b36c',
    messagingSenderId: '913279857925',
    projectId: 'remedialpraktikumpab',
    storageBucket: 'remedialpraktikumpab.firebasestorage.app',
    iosClientId: '913279857925-vhelvamvoicpt5rnhdg5lnm33i791oa9.apps.googleusercontent.com',
    iosBundleId: 'com.example.remedialPraktikumPab',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBo45FnNDWM-8TTpsWJZe-JjZlm69peprY',
    appId: '1:913279857925:ios:9f3f03f6b416319c80b36c',
    messagingSenderId: '913279857925',
    projectId: 'remedialpraktikumpab',
    storageBucket: 'remedialpraktikumpab.firebasestorage.app',
    iosClientId: '913279857925-vhelvamvoicpt5rnhdg5lnm33i791oa9.apps.googleusercontent.com',
    iosBundleId: 'com.example.remedialPraktikumPab',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhOlTl01py-nXKdp9fmUE4VBL9jjD56uU',
    appId: '1:913279857925:web:d32bbc1e7e5167d780b36c',
    messagingSenderId: '913279857925',
    projectId: 'remedialpraktikumpab',
    authDomain: 'remedialpraktikumpab.firebaseapp.com',
    storageBucket: 'remedialpraktikumpab.firebasestorage.app',
    measurementId: 'G-42WDBKVF7B',
  );
  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyXXXXXXX...',
    appId: '1:1234567890:linux:abcdef123456',
    messagingSenderId: '1234567890',
    projectId: 'remedialpraktikumpab',
    storageBucket: 'remedialpraktikumpab.appspot.com',
  );
}
