// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout_controller.dart';

class CheckoutMobile extends StatelessWidget {
  const CheckoutMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          return Column(
            children: [
              SizedBox(
                height: 58,
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
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Pickup Location ---
                      const Text(
                        'Pickup Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.fromLTRB(16, 14, 12, 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.city.isNotEmpty
                                    ? controller.city
                                    : 'Location not set',
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.45,
                                  color: greyText,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      // --- Rental Summary ---
                      const Text(
                        'Rental Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.fromLTRB(16, 16, 16, 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.productName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: darkText,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _summaryRow(
                              Icons.calendar_month_outlined,
                              '${controller.pickupText} - ${controller.returnText}',
                            ),
                            const SizedBox(height: 10),
                            _summaryRow(
                              Icons.timer_outlined,
                              controller.durationText,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '₹${controller.rentalPrice.toStringAsFixed(0)}/day',
                              style: const TextStyle(
                                  fontSize: 16, color: greyText),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // --- Payment Method ---
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          _paymentOption(
                              controller, 'PhonePe', Icons.account_balance),
                          _paymentOption(
                            controller,
                            'Google Pay',
                            Icons.account_balance_wallet_outlined,
                          ),
                          _paymentOption(
                              controller, 'Apply Pay', Icons.apple),
                          _paymentOption(
                            controller,
                            'Cash on delivery',
                            Icons.money_outlined,
                          ),
                        ],
                      ),

                      // --- Payment Details ---
                      _paymentDetails(controller),

                      const SizedBox(height: 18),

                      // --- Pay Button ---
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: Obx(() {
                          return ElevatedButton(
                            onPressed: controller.isBooking.value
                                ? null
                                : () => controller.createBooking(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              disabledBackgroundColor:
                                  primaryColor.withAlpha(128),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: controller.isBooking.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Pay ${controller.payAmount}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                          );
                        }),
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

  static Widget _summaryRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: greyText),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 16, color: greyText)),
      ],
    );
  }

  static Widget _paymentOption(
    CheckoutController controller,
    String title,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () => controller.selectPayment(title),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Obx(() {
              final selected = controller.selectedPayment.value == title;
              return Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? primaryColor : const Color(0xFF202938),
                    width: selected ? 3 : 2,
                  ),
                ),
                child: selected
                    ? Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              );
            }),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Icon(
              icon,
              size: 22,
              color: title == 'PhonePe'
                  ? const Color(0xFF0874B9)
                  : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _paymentDetails(CheckoutController controller) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
              color: darkText,
            ),
          ),
          const Divider(height: 24, color: Color(0xFFE0E0E0)),
          _priceRow('Rental Charge',
              '₹${controller.rentalCharge.toStringAsFixed(0)}'),
          const SizedBox(height: 10),
          _priceRow(
              'Service Fee', '₹${controller.serviceFee.toStringAsFixed(0)}'),
          const SizedBox(height: 10),
          _priceRow('Security Deposit',
              '₹${controller.securityDeposit.toStringAsFixed(0)}'),
          const Divider(height: 24, color: Color(0xFFE0E0E0)),
          _priceRow('Total Amount',
              '₹${controller.totalAmount.toStringAsFixed(0)}',
              bold: true),
        ],
      ),
    );
  }

  static Widget _priceRow(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: bold ? 16 : 14,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            color: darkText,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: bold ? 16 : 14,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            color: darkText,
          ),
        ),
      ],
    );
  }
}
