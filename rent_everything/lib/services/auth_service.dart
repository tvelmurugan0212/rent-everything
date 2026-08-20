import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxController {
  String _userId = '';
  String get userId => _userId;

  static AuthService get instance => Get.find<AuthService>();
  static const String _key = 'device_user_id';

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final existingId = prefs.getString(_key);

    if (existingId != null && existingId.isNotEmpty) {
      _userId = existingId;
    } else {
      _userId = _generateId();
      await prefs.setString(_key, _userId);
    }
    debugPrint('Device userId: $_userId');
  }

  String _generateId() {
    final random = Random.secure();
    final values = List<int>.generate(16, (_) => random.nextInt(256));
    return values.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }
}
