import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/product_details.dart';
import 'checkout_controller.dart';

class CheckoutMobile extends StatelessWidget {
  const CheckoutMobile({super.key});

  static const Color primaryColor = Color(0xFF067FA8);
  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
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
                          const Expanded(
                            child: Text(
                              'Aarav Sharma, 221B Residency Road,\nVellore, 560001',
                              style: TextStyle(
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
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
                            'Toyota Innova Crysta',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF202938),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _summaryRow(
                            Icons.calendar_month_outlined,
                            '08 Aug - 10 Aug',
                          ),
                          const SizedBox(height: 10),
                          _summaryRow(Icons.timer_outlined, '2 Days'),
                          const SizedBox(height: 10),
                          const Text(
                            '₹900/day',
                            style: TextStyle(fontSize: 16, color: greyText),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
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
                          controller,
                          'PhonePe',
                          Icons.account_balance,
                        ),
                        _paymentOption(
                          controller,
                          'Google Pay',
                          Icons.account_balance_wallet_outlined,
                        ),
                        _paymentOption(controller, 'Apply Pay', Icons.apple),
                        _paymentOption(
                          controller,
                          'Cash on delivery',
                          Icons.money_outlined,
                        ),
                      ],
                    ),

                    paymentCard(),

                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Pay ₹6,900',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
}
