import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  final PageController imageController = PageController();

  final currentImage = 0.obs;

  final images = <String>[
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
  ];

  void onImageChanged(int index) {
    currentImage.value = index;
  }

  @override
  void onClose() {
    imageController.dispose();
    super.onClose();
  }
}
