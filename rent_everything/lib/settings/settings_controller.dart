import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool darkMode = true.obs;

  void toggleDarkMode(bool value) {
    darkMode.value = value;
  }
}
