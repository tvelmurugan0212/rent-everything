import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt bannerIndex = 0.obs;

  void changeBanner(int index) {
    bannerIndex.value = index;
  }
}
