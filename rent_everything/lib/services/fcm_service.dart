import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_everything/services/auth_service.dart';

@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint('FCM Background: ${message.messageId}');
}

class FcmService extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  String? _currentToken;

  String? get currentToken => _currentToken;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _currentToken = await _messaging.getToken();
      debugPrint('FCM Token: $_currentToken');

      if (_currentToken != null) {
        await _saveToken(_currentToken!);
      }

      _messaging.onTokenRefresh.listen((token) {
        _currentToken = token;
        _saveToken(token);
      });
    }

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  Future<void> _saveToken(String token) async {
    try {
      final currentUserId = AuthService.instance.userId;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .set({
            'fcmToken': token,
            'updatedAt': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Failed to save FCM token: $e');
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('FCM Foreground: ${message.notification?.title}');

    if (message.notification != null) {
      Get.snackbar(
        message.notification!.title ?? 'Notification',
        message.notification!.body ?? '',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: const EdgeInsets.all(12),
      );
    }
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    debugPrint('FCM Opened from terminated: ${message.notification?.title}');
  }
}
