import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool darkMode = true.obs;
  RxBool emailNotifications = true.obs;
  RxBool bookingNotifications = true.obs;
  RxBool paymentNotifications = true.obs;

  void toggleDarkMode(bool value) {
    darkMode.value = value;
  }

  void toggleEmail(bool value) {
    emailNotifications.value = value;
  }

  void toggleBooking(bool value) {
    bookingNotifications.value = value;
  }

  void togglePayment(bool value) {
    paymentNotifications.value = value;
  }
}
