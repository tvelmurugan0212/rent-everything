// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final RxInt selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}

class Booking extends StatelessWidget {
  Booking({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 18, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _bookingTabs(),
              ),

              const SizedBox(height: 30),

              Obx(
                () => controller.selectedTab.value == 0
                    ? _bookingRequests()
                    : _myBookings(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // TABS
  // ========================================================================

  Widget _bookingTabs() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(3),
      child: Obx(() {
        final int selected = controller.selectedTab.value;

        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.changeTab(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selected == 1 ? primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'My Bookings',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: selected == 1
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selected == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.changeTab(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selected == 0 ? primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Booking Requests',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: selected == 0
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selected == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _bookingRequests() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          _requestCard(
            productName: 'Toyota Innova Crysta',
            customerName: 'Rahul Kumar',
            dates: '08 Aug - 09 Aug',
            price: '₹ 900/day',
          ),

          const SizedBox(height: 28),

          _requestCard(
            productName: 'Toyota Innova Crysta',
            customerName: 'Rahul Kumar',
            dates: '08 Aug - 09 Aug',
            price: '₹ 900/day',
          ),

          const SizedBox(height: 28),

          _requestCard(
            productName: 'Toyota Innova Crysta',
            customerName: 'Rahul Kumar',
            dates: '08 Aug - 09 Aug',
            price: '₹ 900/day',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _requestCard({
    required String productName,
    required String customerName,
    required String dates,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 14,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product
          Text(
            productName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: darkText,
            ),
          ),

          const SizedBox(height: 14),

          // Customer
          Text(
            customerName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),

          const SizedBox(height: 10),

          // Date
          Text(
            dates,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),

          const SizedBox(height: 10),

          // Price
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),

          const SizedBox(height: 28),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: SizedBox(
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: const BorderSide(color: primaryColor, width: 1.5),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _myBookings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          _myBookingCard(dates: '08 Aug – 10 Aug'),

          const SizedBox(height: 28),

          _myBookingCard(dates: '12 Aug – 19 Aug'),

          const SizedBox(height: 28),

          _myBookingCard(dates: '08 Aug – 10 Aug'),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _myBookingCard({required String dates}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 14,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 24,
                color: Colors.black,
              ),

              const SizedBox(width: 14),

              Text(
                dates,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Divider(color: Color(0xFFD0D0D0), thickness: 1, height: 1),

          const SizedBox(height: 14),

          const Text(
            'Toyota Innova Crysta',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: darkText,
            ),
          ),

          const SizedBox(height: 18),

          // ================================================================
          // BOOKING ID
          // ================================================================
          const Text(
            'Booking ID: #RE102548',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: greyText,
            ),
          ),

          const SizedBox(height: 10),

          // ================================================================
          // LOCATION
          // ================================================================
          const Row(
            children: [
              Icon(Icons.location_on, size: 20, color: greyText),

              SizedBox(width: 10),

              Text(
                'Vellore, Tamil Nadu',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: greyText,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Divider(color: Color(0xFFD0D0D0), thickness: 1, height: 1),

          const SizedBox(height: 14),

          // ================================================================
          // BUTTONS
          // ================================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Manage Rental',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: SizedBox(
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: const BorderSide(color: primaryColor, width: 1.5),
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel Rental',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
