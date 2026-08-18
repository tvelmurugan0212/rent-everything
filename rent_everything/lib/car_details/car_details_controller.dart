import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  final PageController imageController = PageController();
  final currentImage = 0.obs;

  final Rxn<Map<String, dynamic>> product = Rxn<Map<String, dynamic>>();
  final RxBool isLoading = true.obs;

  String get productId {
    final args = Get.arguments;
    if (args is Map && args['id'] != null) {
      return args['id'].toString();
    }
    return '';
  }

  @override
  void onInit() {
    super.onInit();
    if (productId.isNotEmpty) {
      fetchProduct();
    } else {
      isLoading.value = false;
    }
  }

  void onImageChanged(int index) {
    currentImage.value = index;
  }

  void fetchProduct() {
    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .snapshots()
        .listen(
      (docSnapshot) {
        if (docSnapshot.exists) {
          product.value = {'id': docSnapshot.id, ...docSnapshot.data()!};
        }
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  String get imageUrl => product.value?['imageUrl'] ?? '';
  String get productName => product.value?['productName'] ?? '';
  String get description => product.value?['description'] ?? '';
  String get category => product.value?['category'] ?? '';
  String get brand => product.value?['brand'] ?? '';
  String get city => product.value?['pickupCity'] ?? '';
  String get condition => product.value?['condition'] ?? '';
  double get rentalPrice => (product.value?['rentalPrice'] ?? 0).toDouble();
  double get securityDeposit =>
      (product.value?['securityDeposit'] ?? 0).toDouble();
  bool get isWishlist => product.value?['isWishlist'] ?? false;

  static Widget buildImage(String image,
      {double? width, double? height, BoxFit? fit}) {
    if (image.startsWith('data:image')) {
      final String base64Data = image.split(',').last;
      return Image.memory(
        base64Decode(base64Data),
        width: width,
        height: height,
        fit: fit,
      );
    } else if (image.startsWith('http')) {
      return Image.network(image, width: width, height: height, fit: fit);
    } else {
      return Image.asset(
        image.isNotEmpty ? image : 'assets/images/car.png',
        width: width,
        height: height,
        fit: fit,
      );
    }
  }

  Future<void> toggleWishlist() async {
    if (productId.isEmpty) return;
    final bool newValue = !isWishlist;
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .update({'isWishlist': newValue});
  }

  @override
  void onClose() {
    imageController.dispose();
    super.onClose();
  }
}
