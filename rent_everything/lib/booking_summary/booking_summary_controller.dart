import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingSummaryController extends GetxController {
  final pickupDate = Rxn<DateTime>();
  final returnDate = Rxn<DateTime>();
  final Rxn<Map<String, dynamic>> product = Rxn<Map<String, dynamic>>();
  final RxBool isLoading = true.obs;
  final RxBool showDateErrors = false.obs;

  final dateFormat = DateFormat('dd MMM yyyy');
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _productSub;

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

  void fetchProduct() {
    _productSub = FirebaseFirestore.instance
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
  double get rentalPrice => (product.value?['rentalPrice'] ?? 0).toDouble();
  double get securityDeposit =>
      (product.value?['securityDeposit'] ?? 0).toDouble();
  String get city => product.value?['pickupCity'] ?? '';
  String get description => product.value?['description'] ?? '';

  double get serviceFee => 100;
  double get totalAmount => rentalPrice + serviceFee + securityDeposit;

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

  Future<void> selectPickupDate(BuildContext context) async {
    final now = DateTime.now();

    final selected = await showDatePicker(
      context: context,
      initialDate: pickupDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (selected != null) {
      pickupDate.value = selected;

      if (returnDate.value != null && returnDate.value!.isBefore(selected)) {
        returnDate.value = selected;
      }
    }
  }

  Future<void> selectReturnDate(BuildContext context) async {
    final pickup = pickupDate.value;

    if (pickup == null) {
      Get.snackbar(
        'Select Pickup Date',
        'Please select the pickup date first.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final selected = await showDatePicker(
      context: context,
      initialDate: returnDate.value ?? pickup.add(const Duration(days: 1)),
      firstDate: pickup,
      lastDate: DateTime(pickup.year + 2),
    );

    if (selected != null) {
      returnDate.value = selected;
    }
  }

  String get pickupText {
    if (pickupDate.value == null) {
      return 'Select pickup date';
    }
    return dateFormat.format(pickupDate.value!);
  }

  String get returnText {
    if (returnDate.value == null) {
      return 'Select return date';
    }
    return dateFormat.format(returnDate.value!);
  }

  @override
  void onClose() {
    _productSub?.cancel();
    super.onClose();
  }
}
