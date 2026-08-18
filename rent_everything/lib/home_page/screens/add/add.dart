import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_controller.dart';

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
          child: Form(
            key: controller.formKey,
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
                  validator: controller.validateProductName,
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
                  validator: controller.validateCategory,
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
                  validator: controller.validateBrand,
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
                  validator: controller.validateDescription,
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
                  validator: controller.validateRentalPrice,
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
                  validator: controller.validateSecurityDeposit,
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
                  validator: controller.validateAvailableFrom,
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
                  validator: controller.validateAvailableUntil,
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
                  validator: controller.validateCondition,
                ),

                // =========================================================
                // SAVE
                // =========================================================
                const SizedBox(height: 20),

                Obx(() {
                  final bool saving = controller.isLoading.value;

                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: saving ? null : controller.saveProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: primaryColor.withValues(alpha: 0.6),
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: saving
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  );
                }),

                const SizedBox(height: 20),
              ],
            ),
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
      final bool showErrors = controller.hasAttemptedSave.value;
      final String? imageError = showErrors ? controller.validateImage() : null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
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
                          const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 51,
                            color: Color.fromARGB(255, 39, 39, 39),
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
          ),
          if (imageError != null) ...[
            const SizedBox(height: 6),
            Text(
              imageError,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ],
        ],
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
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
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
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.red,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
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
    String? Function()? validator,
  }) {
    return Obx(() {
      final String currentValue = value.value;
      final bool showErrors = controller.hasAttemptedSave.value;
      final String? error =
          (showErrors && validator != null) ? validator() : null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
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
                            title: Text(
                              item,
                              style: const TextStyle(fontSize: 16),
                            ),
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
                border: Border.all(
                  color: error != null ? Colors.red : borderColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      currentValue.isEmpty ? hint : currentValue,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            currentValue.isEmpty ? hintText : Colors.black,
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
          ),
          if (error != null) ...[
            const SizedBox(height: 6),
            Text(
              error,
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ],
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
    String? Function()? validator,
  }) {
    return Obx(() {
      final DateTime? selectedDate = date.value;
      final bool showErrors = controller.hasAttemptedSave.value;
      final String? error =
          (showErrors && validator != null) ? validator() : null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: error != null ? Colors.red : borderColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? hint
                          : _formatDate(selectedDate),
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedDate == null
                            ? hintText
                            : Colors.black,
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
          ),
          if (error != null) ...[
            const SizedBox(height: 6),
            Text(
              error,
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ],
      );
    });
  }

  // ========================================================================
  // LOCATION
  // ========================================================================

  Widget _locationField() {
    return TextFormField(
      controller: controller.pickupCityController,
      validator: controller.validatePickupCity,
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
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
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
