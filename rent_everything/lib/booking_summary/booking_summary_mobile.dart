// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/product_details.dart';
import '../common_widgets/rental_cards.dart';
import 'booking_summary_controller.dart';

class BookingSummaryMobile extends StatelessWidget {
  BookingSummaryMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  final controller = Get.put(BookingSummaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RentalCard(
                      image: 'assets/images/car.png',
                      title: 'Toyota Innova Crysta',
                      rating: '4.8',
                      reviews: '124',
                      location: 'Vellore',
                      distance: '2 km',
                      price: '2,500/day',
                      availability: 'Available Today',
                      onpress: () {},
                      onRentNow: () {},
                      onFavorite: () {
                        // Favorite action
                      },
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
                      onTap: () => controller.selectPickupDate(context),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Obx(
                    () => _dateSection(
                      title: 'Return',
                      date: controller.returnText,
                      onTap: () => controller.selectReturnDate(context),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: paymentCard(),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

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
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF858585),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '₹6,900',
                            style: TextStyle(
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
                            // Navigate to the checkout page
                            Get.toNamed('/checkout');
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
        ),
      ),
    );
  }

  static Widget _dateSection({
    required String title,
    required String date,
    required VoidCallback onTap,
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
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
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
        ],
      ),
    );
  }
}
