import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final selectedPayment = 'PhonePe'.obs;

  void selectPayment(String value) {
    selectedPayment.value = value;
  }
}
