import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return ios;
    } else {
      return android;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'your-web-api-key',
    appId: 'your-web-app-id',
    messagingSenderId: 'your-web-messaging-sender-id',
    projectId: 'your-web-project-id',
    authDomain: 'your-web-auth-domain',
    storageBucket: 'your-web-storage-bucket',
    measurementId: 'your-web-measurement-id',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtm14Z2jspCS8-THRNPwphjF3OPwHXbS8',
    appId: '1:521661719667:android:115167750092da9b343606',
    messagingSenderId: '521661719667',
    projectId: 'explore-79870',
    storageBucket: 'explore-79870.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'your-ios-api-key',
    appId: 'your-ios-app-id',
    messagingSenderId: 'your-ios-messaging-sender-id',
    projectId: 'your-ios-project-id',
    storageBucket: 'your-ios-storage-bucket',
    iosClientId: 'your-ios-client-id',
    iosBundleId: 'your-ios-bundle-id',
  );
}
