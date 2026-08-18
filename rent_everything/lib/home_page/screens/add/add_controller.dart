import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  // ============================================================
  // TEXT CONTROLLERS
  // ============================================================

  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final rentalPriceController = TextEditingController();
  final securityDepositController = TextEditingController();
  final pickupCityController = TextEditingController();
  final conditionController = TextEditingController();

  // ============================================================
  // IMAGE
  // ============================================================

  final Rxn<File> selectedImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  // ============================================================
  // CATEGORY / BRAND
  // ============================================================

  final RxString selectedCategory = ''.obs;
  final RxString selectedBrand = ''.obs;

  final List<String> categories = [
    'Bike',
    'Car',
    'Camera',
    'Laptop',
    'Furniture',
  ];

  final List<String> brands = [
    'Toyota',
    'Honda',
    'Canon',
    'Nikon',
    'Dell',
    'Samsung',
  ];

  // ============================================================
  // DATES
  // ============================================================

  final Rxn<DateTime> availableFrom = Rxn<DateTime>();
  final Rxn<DateTime> availableUntil = Rxn<DateTime>();

  // ============================================================
  // IMAGE PICKER
  // ============================================================

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // ============================================================
  // REMOVE IMAGE
  // ============================================================

  void removeImage() {
    selectedImage.value = null;
  }

  // ============================================================
  // CATEGORY
  // ============================================================

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // ============================================================
  // BRAND
  // ============================================================

  void selectBrand(String brand) {
    selectedBrand.value = brand;
  }

  // ============================================================
  // DATE
  // ============================================================

  Future<void> selectAvailableFrom(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      availableFrom.value = date;

      // If end date is before start date, clear it.
      if (availableUntil.value != null &&
          availableUntil.value!.isBefore(date)) {
        availableUntil.value = null;
      }
    }
  }

  Future<void> selectAvailableUntil(BuildContext context) async {
    final DateTime firstDate = availableFrom.value ?? DateTime.now();

    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );

    if (date != null) {
      availableUntil.value = date;
    }
  }

  // ============================================================
  // SAVE
  // ============================================================

  void saveProduct() {
    if (productNameController.text.trim().isEmpty) {
      Get.snackbar(
        'Required',
        'Please enter product name',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedCategory.value.isEmpty) {
      Get.snackbar(
        'Required',
        'Please select category',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedImage.value == null) {
      Get.snackbar(
        'Required',
        'Please select product image',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // API call can be added here.
    //
    // Example:
    //
    // await repository.addProduct(
    //   name: productNameController.text,
    //   category: selectedCategory.value,
    //   image: selectedImage.value!,
    // );

    Get.snackbar(
      'Success',
      'Product saved successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    productNameController.dispose();
    descriptionController.dispose();
    rentalPriceController.dispose();
    securityDepositController.dispose();
    pickupCityController.dispose();
    conditionController.dispose();

    super.onClose();
  }
}
