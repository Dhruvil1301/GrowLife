import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/firebase_option.dart';
import 'package:growlife/src/Common/Controller/notification.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/app.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationService().showNotification(message.notification?.title, message.notification?.body);
}

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FcmTokenManager.saveFcmToken();
  String? fcmToken = await FcmTokenManager.getFcmToken();
  print("FCM Token: $fcmToken");

  NotificationService notificationService = NotificationService();
  await notificationService.initialize();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await requestNotificationPermissions();

  runApp(
    ProviderScope(child: App()),
  );
}


