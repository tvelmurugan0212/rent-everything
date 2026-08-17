import 'dart:io';
import 'dart:ui';

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

// ============================================================================
// ADD PAGE
// ============================================================================

class AddPage extends StatelessWidget {
  AddPage({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);
  static const Color hintText = Color(0xFF858585);
  static const Color borderColor = Color(0xFFE0E0E0);

  final AddController controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 18,
            left: 20,
            right: 20,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================================================
              // TITLE
              // =========================================================
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              // =========================================================
              // IMAGE UPLOAD
              // =========================================================
              const SizedBox(height: 36),

              _uploadBox(),

              // =========================================================
              // PRODUCT NAME
              // =========================================================
              const SizedBox(height: 46),

              _label('Product Name'),

              const SizedBox(height: 10),

              _inputField(
                controller: controller.productNameController,
                hint: 'Enter Product Name',
              ),

              // =========================================================
              // CATEGORY
              // =========================================================
              const SizedBox(height: 20),

              _label('Category'),

              const SizedBox(height: 10),

              _selectField(
                context: context,
                value: controller.selectedCategory,
                hint: 'Select Category',
                items: controller.categories,
                onSelected: controller.selectCategory,
              ),

              // =========================================================
              // BRAND
              // =========================================================
              const SizedBox(height: 20),

              _label('Brand'),

              const SizedBox(height: 10),

              _selectField(
                context: context,
                value: controller.selectedBrand,
                hint: 'Select Brand',
                items: controller.brands,
                onSelected: controller.selectBrand,
              ),

              // =========================================================
              // DESCRIPTION
              // =========================================================
              const SizedBox(height: 20),

              _label('Description'),

              const SizedBox(height: 10),

              _inputField(
                controller: controller.descriptionController,
                hint: 'Enter Details',
              ),

              // =========================================================
              // RENTAL PRICE
              // =========================================================
              const SizedBox(height: 20),

              _label('Rental Price'),

              const SizedBox(height: 10),

              _inputField(
                controller: controller.rentalPriceController,
                hint: 'Enter amount / day',
                prefix: '₹',
                keyboardType: TextInputType.number,
              ),

              // =========================================================
              // SECURITY DEPOSIT
              // =========================================================
              const SizedBox(height: 20),

              _label('Security Deposit'),

              const SizedBox(height: 10),

              _inputField(
                controller: controller.securityDepositController,
                hint: 'Enter Security Deposit',
                prefix: '₹',
                keyboardType: TextInputType.number,
              ),

              // =========================================================
              // AVAILABLE FROM
              // =========================================================
              const SizedBox(height: 20),

              _label('Available From'),

              const SizedBox(height: 10),

              _dateField(
                context: context,
                date: controller.availableFrom,
                hint: 'Select Start Date',
                onTap: () {
                  controller.selectAvailableFrom(context);
                },
              ),

              // =========================================================
              // AVAILABLE UNTIL
              // =========================================================
              const SizedBox(height: 20),

              _label('Available Until'),

              const SizedBox(height: 10),

              _dateField(
                context: context,
                date: controller.availableUntil,
                hint: 'Select End Date',
                onTap: () {
                  controller.selectAvailableUntil(context);
                },
              ),

              // =========================================================
              // PICKUP LOCATION
              // =========================================================
              const SizedBox(height: 20),

              _label('Pickup Location City'),

              const SizedBox(height: 10),

              _locationField(),

              // =========================================================
              // CONDITION
              // =========================================================
              const SizedBox(height: 20),

              _label('Condition'),

              const SizedBox(height: 10),

              _inputField(
                controller: controller.conditionController,
                hint: 'Enter Condition',
              ),

              // =========================================================
              // SAVE
              // =========================================================
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.saveProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // IMAGE UPLOAD BOX
  // ========================================================================

  Widget _uploadBox() {
    return Obx(() {
      final File? image = controller.selectedImage.value;

      return GestureDetector(
        onTap: controller.pickImage,
        child: CustomPaint(
          painter: _DashedBorderPainter(),
          child: Container(
            width: double.infinity,
            height: 218,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: borderColor),
            ),
            child: image != null
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.file(image, fit: BoxFit.cover),
                        ),
                      ),

                      // Remove button
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: controller.removeImage,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 51,
                        color: const Color.fromARGB(255, 39, 39, 39),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Upload your image here',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        '500 MB max image size',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA5AFBE),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }

  // ========================================================================
  // LABEL
  // ========================================================================

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: darkText,
      ),
    );
  }

  // ========================================================================
  // INPUT FIELD
  // ========================================================================

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    String? prefix,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: hintText,
            fontWeight: FontWeight.w400,
          ),
          prefixText: prefix != null ? '$prefix ' : null,
          prefixStyle: const TextStyle(
            fontSize: 18,
            color: hintText,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // CATEGORY / BRAND
  // ========================================================================

  Widget _selectField({
    required BuildContext context,
    required RxString value,
    required String hint,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    return Obx(() {
      final String currentValue = value.value;

      return GestureDetector(
        onTap: () {
          Get.bottomSheet(
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),

                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 18),

                    ...items.map(
                      (item) => ListTile(
                        title: Text(item, style: const TextStyle(fontSize: 16)),
                        trailing: currentValue == item
                            ? const Icon(Icons.check, color: primaryColor)
                            : null,
                        onTap: () {
                          onSelected(item);
                          Get.back();
                        },
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  currentValue.isEmpty ? hint : currentValue,
                  style: TextStyle(
                    fontSize: 16,
                    color: currentValue.isEmpty ? hintText : Colors.black,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    });
  }

  // ========================================================================
  // DATE FIELD
  // ========================================================================

  Widget _dateField({
    required BuildContext context,
    required Rxn<DateTime> date,
    required String hint,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      final DateTime? selectedDate = date.value;

      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDate == null ? hint : _formatDate(selectedDate),
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedDate == null ? hintText : Colors.black,
                  ),
                ),
              ),

              const Icon(
                Icons.calendar_month_outlined,
                size: 27,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    });
  }

  // ========================================================================
  // LOCATION
  // ========================================================================

  Widget _locationField() {
    return SizedBox(
      height: 64,
      child: TextField(
        controller: controller.pickupCityController,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Enter pickup city',
          hintStyle: const TextStyle(fontSize: 16, color: hintText),
          suffixIcon: const Icon(
            Icons.location_on_outlined,
            size: 28,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // DATE FORMAT
  // ========================================================================

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

// ============================================================================
// DASHED BORDER
// ============================================================================

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 10;
    const double dashSpace = 9;

    final Paint paint = Paint()
      ..color = const Color(0xFF555555)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
      const Radius.circular(11),
    );

    final Path path = Path()..addRRect(rRect);

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final double nextDistance = distance + dashWidth;

        canvas.drawPath(
          metric.extractPath(
            distance,
            nextDistance > metric.length ? metric.length : nextDistance,
          ),
          paint,
        );

        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
