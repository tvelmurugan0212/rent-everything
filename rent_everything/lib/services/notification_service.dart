import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _fcmApiUrl =
      'https://fcm.googleapis.com/v1/projects/rent-everything-5b7e7/messages:send';
  static const List<String> _scopes = [
    'https://www.googleapis.com/auth/firebase.messaging',
  ];

  String? _cachedAccessToken;
  DateTime? _tokenExpiry;

  Future<void> sendBookingNotification({
    required String ownerId,
    required String productName,
    required String bookingId,
    required String renterId,
  }) async {
    debugPrint('=== NOTIFICATION FLOW START ===');
    debugPrint('ownerId: $ownerId, productName: $productName, bookingId: $bookingId');

    try {
      debugPrint('Looking up owner: users/$ownerId');
      final ownerDoc =
          await _firestore.collection('users').doc(ownerId).get();

      if (!ownerDoc.exists) {
        debugPrint('ERROR: Owner $ownerId not found');
        return;
      }

      final fcmToken = ownerDoc.data()?['fcmToken'] as String?;
      if (fcmToken == null || fcmToken.isEmpty) {
        debugPrint('ERROR: Owner $ownerId has no FCM token');
        return;
      }

      debugPrint('FCM token found: ${fcmToken.substring(0, 20)}...');

      await _saveNotification(
        ownerId: ownerId,
        title: 'New Booking Received!',
        body: 'Your item "$productName" has been booked by a renter.',
        type: 'new_booking',
        data: {
          'bookingId': bookingId,
          'productName': productName,
          'renterId': renterId,
        },
      );
      debugPrint('Notification saved to Firestore');

      await _sendPushNotification(
        fcmToken: fcmToken,
        title: 'New Booking Received!',
        body: 'Your item "$productName" has been booked.',
        data: {
          'bookingId': bookingId,
          'productName': productName,
          'type': 'new_booking',
        },
      );

      debugPrint('=== NOTIFICATION FLOW END ===');
    } catch (e, stack) {
      debugPrint('ERROR in sendBookingNotification: $e');
      debugPrint('Stack: $stack');
    }
  }

  Future<void> _sendPushNotification({
    required String fcmToken,
    required String title,
    required String body,
    required Map<String, dynamic> data,
  }) async {
    try {
      final accessToken = await _getAccessToken();
      if (accessToken == null) {
        debugPrint('ERROR: Failed to get access token');
        return;
      }
      debugPrint('Access token obtained');

      debugPrint('Sending FCM push...');
      final response = await http.post(
        Uri.parse(_fcmApiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(<String, dynamic>{
          'message': <String, dynamic>{
            'token': fcmToken,
            'notification': <String, dynamic>{
              'title': title,
              'body': body,
            },
            'data': data,
          },
        }),
      );

      debugPrint('FCM response: ${response.statusCode} ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('FCM push sent successfully');
      } else {
        debugPrint('FCM push FAILED');
      }
    } catch (e) {
      debugPrint('FCM push error: $e');
    }
  }

  Future<String?> _getAccessToken() async {
    if (_cachedAccessToken != null &&
        _tokenExpiry != null &&
        DateTime.now().isBefore(_tokenExpiry!)) {
      return _cachedAccessToken;
    }

    try {
      final serviceAccountJson =
          await rootBundle.loadString('assets/google-service-account.json');
      final serviceAccount = jsonDecode(serviceAccountJson);

      final credentials = ServiceAccountCredentials.fromJson(serviceAccount);

      final client = await clientViaServiceAccount(credentials, _scopes);
      final accessToken = client.credentials.accessToken;

      _cachedAccessToken = accessToken.data;
      _tokenExpiry = accessToken.expiry.subtract(const Duration(minutes: 5));

      client.close();

      debugPrint('Access token obtained via googleapis_auth');
      return _cachedAccessToken;
    } catch (e) {
      debugPrint('Error getting access token: $e');
      return null;
    }
  }

  Future<void> _saveNotification({
    required String ownerId,
    required String title,
    required String body,
    required String type,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection('notifications').add({
      'userId': ownerId,
      'title': title,
      'body': body,
      'type': type,
      'data': data,
      'isRead': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> sendBookingConfirmation({
    required String renterId,
    required String productName,
    required String bookingId,
  }) async {
    try {
      debugPrint('=== RENTER NOTIFICATION START ===');
      debugPrint('renterId: $renterId, productName: $productName');

      final renterDoc =
          await _firestore.collection('users').doc(renterId).get();

      if (!renterDoc.exists) {
        debugPrint('Renter $renterId not found, saving in-app only');
      } else {
        final fcmToken = renterDoc.data()?['fcmToken'] as String?;
        if (fcmToken != null && fcmToken.isNotEmpty) {
          final accessToken = await _getAccessToken();
          if (accessToken != null) {
            final response = await http.post(
              Uri.parse(_fcmApiUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $accessToken',
              },
              body: jsonEncode(<String, dynamic>{
                'message': <String, dynamic>{
                  'token': fcmToken,
                  'notification': <String, dynamic>{
                    'title': 'Booking Confirmed!',
                    'body':
                        'Your booking for "$productName" has been confirmed.',
                  },
                  'data': <String, dynamic>{
                    'bookingId': bookingId,
                    'productName': productName,
                    'type': 'booking_confirmed',
                  },
                },
              }),
            );
            debugPrint(
                'Renter FCM response: ${response.statusCode}');
          }
        }
      }

      await _saveNotification(
        ownerId: renterId,
        title: 'Booking Confirmed!',
        body: 'Your booking for "$productName" has been confirmed.',
        type: 'booking_confirmed',
        data: {
          'bookingId': bookingId,
          'productName': productName,
        },
      );
      debugPrint('=== RENTER NOTIFICATION END ===');
    } catch (e) {
      debugPrint('ERROR in sendBookingConfirmation: $e');
    }
  }
}
