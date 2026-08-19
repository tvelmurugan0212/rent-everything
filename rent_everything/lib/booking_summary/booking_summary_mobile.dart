// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/rental_cards.dart';
import 'booking_summary_controller.dart';

class BookingSummaryMobile extends StatelessWidget {
  const BookingSummaryMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingSummaryController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          if (controller.product.value == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline,
                      size: 60, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text('Product not found',
                      style: TextStyle(fontSize: 16, color: greyText)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    child: const Text('Go Back',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 55,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              padding: const EdgeInsets.only(left: 12),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text(
                            'Booking Summary',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // --- Product Card ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RentalCard(
                        image: controller.imageUrl.isNotEmpty
                            ? controller.imageUrl
                            : 'assets/images/car.png',
                        title: controller.productName,
                        rating: '4.8',
                        reviews: '0',
                        location: controller.city,
                        distance: '0 km',
                        price:
                            '${controller.rentalPrice.toStringAsFixed(0)}/day',
                        availability: 'Available',
                        onpress: () {},
                        onRentNow: () {},
                        onFavorite: () {},
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Rental Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    Obx(
                      () => _dateSection(
                        title: 'Pickup',
                        date: controller.pickupText,
                        hasError: controller.showDateErrors.value &&
                            controller.pickupDate.value == null,
                        onTap: () {
                          controller.showDateErrors.value = false;
                          controller.selectPickupDate(context);
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    Obx(
                      () => _dateSection(
                        title: 'Return',
                        date: controller.returnText,
                        hasError: controller.showDateErrors.value &&
                            controller.returnDate.value == null,
                        onTap: () {
                          controller.showDateErrors.value = false;
                          controller.selectReturnDate(context);
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    // --- Payment Details ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _paymentDetails(controller),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // --- Bottom Bar ---
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Price',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF858585),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '₹${controller.totalAmount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: darkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              final hasPickup =
                                  controller.pickupDate.value != null;
                              final hasReturn =
                                  controller.returnDate.value != null;

                              if (!hasPickup || !hasReturn) {
                                controller.showDateErrors.value = true;
                                Get.snackbar(
                                  'Missing Dates',
                                  'Please select both pickup and return dates.',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              }

                              controller.showDateErrors.value = false;
                              Get.toNamed('/checkout', arguments: {
                                'id': controller.productId,
                                'pickupDate': controller
                                    .pickupDate.value?.toIso8601String(),
                                'returnDate': controller
                                    .returnDate.value?.toIso8601String(),
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Proceed to Checkout',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  static Widget _dateSection({
    required String title,
    required String date,
    required VoidCallback onTap,
    bool hasError = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 20,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color(0xFFE0E0E0), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: date.startsWith('Select')
                            ? const Color(0xFF858585)
                            : Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 19,
                    color: Color(0xFF666666),
                  ),
                ],
              ),
            ),
          ),
          if (hasError)
            const Padding(
              padding: EdgeInsets.only(top: 6, left: 4),
              child: Text(
                'This field is required',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Widget _paymentDetails(BookingSummaryController controller) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const Divider(height: 24, color: Color(0xFFE0E0E0)),
          _paymentRow(
            'Rental Charge',
            '₹${controller.rentalPrice.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 10),
          _paymentRow(
            'Service Fee',
            '₹${controller.serviceFee.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 10),
          _paymentRow(
            'Security Deposit',
            '₹${controller.securityDeposit.toStringAsFixed(0)}',
          ),
          const Divider(height: 24, color: Color(0xFFE0E0E0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                '₹${controller.totalAmount.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _paymentRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: greyText),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
