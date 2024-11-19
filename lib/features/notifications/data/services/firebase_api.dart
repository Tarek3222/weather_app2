import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fcmToken =
        await firebaseMessaging.getToken(); // Get the token of the device
    log('FCM Token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  log('title: ${message.notification?.title}');
  log('body: ${message.notification?.body}');
  log('payload: ${message.data}');
}
