import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  // ============================================================
  // FORM KEY
  // ============================================================

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  // LOADING STATE
  // ============================================================

  final RxBool isLoading = false.obs;
  final RxBool hasAttemptedSave = false.obs;

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
  // VALIDATORS
  // ============================================================

  String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter description';
    }
    return null;
  }

  String? validateRentalPrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter rental price';
    }
    final double? price = double.tryParse(value.trim());
    if (price == null || price <= 0) {
      return 'Please enter a valid price greater than 0';
    }
    return null;
  }

  String? validateSecurityDeposit(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter security deposit';
    }
    final double? deposit = double.tryParse(value.trim());
    if (deposit == null || deposit < 0) {
      return 'Please enter a valid deposit amount';
    }
    return null;
  }

  String? validatePickupCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter pickup city';
    }
    return null;
  }

  String? validateCondition(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter condition';
    }
    return null;
  }

  String? validateImage() {
    if (selectedImage.value == null) {
      return 'Please select a product image';
    }
    return null;
  }

  String? validateCategory() {
    if (selectedCategory.value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  String? validateBrand() {
    if (selectedBrand.value.isEmpty) {
      return 'Please select a brand';
    }
    return null;
  }

  String? validateAvailableFrom() {
    if (availableFrom.value == null) {
      return 'Please select start date';
    }
    return null;
  }

  String? validateAvailableUntil() {
    if (availableUntil.value == null) {
      return 'Please select end date';
    }
    return null;
  }

  // ============================================================
  // SAVE PRODUCT
  // ============================================================

  Future<void> saveProduct() async {
    hasAttemptedSave.value = true;

    // Validate all text fields via Form
    if (!formKey.currentState!.validate()) return;

    // Validate dropdowns, dates, and image
    if (selectedCategory.value.isEmpty) {
      Get.snackbar(
        'Required',
        'Please select a category',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    if (selectedBrand.value.isEmpty) {
      Get.snackbar(
        'Required',
        'Please select a brand',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    if (availableFrom.value == null) {
      Get.snackbar(
        'Required',
        'Please select available from date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    if (availableUntil.value == null) {
      Get.snackbar(
        'Required',
        'Please select available until date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    if (selectedImage.value == null) {
      Get.snackbar(
        'Required',
        'Please select a product image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    try {
      isLoading.value = true;

      // --- Convert Image to Base64 ---
      final List<int> imageBytes = await selectedImage.value!.readAsBytes();
      final String base64Image = base64Encode(imageBytes);
      final String imageDataUrl = 'data:image/jpeg;base64,$base64Image';

      // --- Save to Cloud Firestore ---
      final double rentalPrice =
          double.parse(rentalPriceController.text.trim());
      final double securityDeposit =
          double.parse(securityDepositController.text.trim());

      final Timestamp now = Timestamp.now();

      await FirebaseFirestore.instance.collection('products').add({
        'productName': productNameController.text.trim(),
        'description': descriptionController.text.trim(),
        'category': selectedCategory.value,
        'brand': selectedBrand.value,
        'rentalPrice': rentalPrice,
        'securityDeposit': securityDeposit,
        'availableFrom': Timestamp.fromDate(availableFrom.value!),
        'availableUntil': Timestamp.fromDate(availableUntil.value!),
        'pickupCity': pickupCityController.text.trim(),
        'condition': conditionController.text.trim(),
        'imageUrl': imageDataUrl,
        'createdAt': now,
        'updatedAt': now,
      });

      // --- Success ---
      Get.snackbar(
        'Success',
        'Product saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.black,
      );

      resetForm();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save product: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ============================================================
  // RESET FORM
  // ============================================================

  void resetForm() {
    hasAttemptedSave.value = false;

    productNameController.clear();
    descriptionController.clear();
    rentalPriceController.clear();
    securityDepositController.clear();
    pickupCityController.clear();
    conditionController.clear();

    selectedImage.value = null;
    selectedCategory.value = '';
    selectedBrand.value = '';
    availableFrom.value = null;
    availableUntil.value = null;

    formKey.currentState?.reset();
  }

  // ============================================================
  // DISPOSE
  // ============================================================

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
