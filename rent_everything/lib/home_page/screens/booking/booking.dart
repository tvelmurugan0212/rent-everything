// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_controller.dart';

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
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 0) {
                  return _bookingRequestsEmpty();
                }
                return _myBookingsList();
              }),
            ),
          ],
        ),
      ),
    );
  }

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
                onTap: () => controller.changeTab(1),
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
                onTap: () => controller.changeTab(0),
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

  Widget _bookingRequestsEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 50, color: greyText),
          SizedBox(height: 8),
          Text(
            'No booking requests yet',
            style: TextStyle(fontSize: 14, color: greyText),
          ),
        ],
      ),
    );
  }

  Widget _myBookingsList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: primaryColor),
        );
      }

      if (controller.bookings.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 50,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 12),
              const Text(
                'No bookings yet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Your bookings will appear here',
                style: TextStyle(fontSize: 13, color: greyText),
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        itemCount: controller.bookings.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final booking = controller.bookings[index];
          final String productName =
              booking['productName'] ?? 'Unknown Vehicle';
          final String city = booking['pickupCity'] ?? '';
          final String bookingId = booking['id'] ?? '';
          final double totalAmount = (booking['totalAmount'] ?? 0).toDouble();
          final String dates = controller.formatDates(
            booking['pickupDate'],
            booking['returnDate'],
          );
          final String imageUrl = booking['imageUrl'] ?? '';
          final int numberOfDays = booking['numberOfDays'] ?? 1;

          return _myBookingCard(
            productName: productName,
            dates: dates,
            city: city,
            bookingId: bookingId,
            totalAmount: totalAmount,
            numberOfDays: numberOfDays,
            imageUrl: imageUrl,
          );
        },
      );
    });
  }

  Widget _myBookingCard({
    required String productName,
    required String dates,
    required String city,
    required String bookingId,
    required double totalAmount,
    required int numberOfDays,
    required String imageUrl,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildBookingImage(imageUrl, 50, 50),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 14,
                          color: greyText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          dates,
                          style: const TextStyle(fontSize: 13, color: greyText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFD0D0D0), thickness: 1, height: 1),
          const SizedBox(height: 12),
          Text(
            'Booking ID: #${bookingId.substring(0, bookingId.length > 8 ? 8 : bookingId.length).toUpperCase()}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: greyText,
            ),
          ),
          const SizedBox(height: 8),
          if (city.isNotEmpty)
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: greyText),
                const SizedBox(width: 6),
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyText,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          Text(
            '$numberOfDays Day${numberOfDays > 1 ? 's' : ''}  •  ₹${totalAmount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: darkText,
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFD0D0D0), thickness: 1, height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'Manage Rental',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: const BorderSide(color: primaryColor, width: 1.5),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancel Rental',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
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

  static Widget _buildBookingImage(String image, double w, double h) {
    if (image.startsWith('data:image')) {
      final String base64Data = image.split(',').last;
      return Image.memory(
        base64Decode(base64Data),
        width: w,
        height: h,
        fit: BoxFit.cover,
      );
    } else if (image.startsWith('http')) {
      return Image.network(image, width: w, height: h, fit: BoxFit.cover);
    } else {
      return Image.asset(
        image.isNotEmpty ? image : 'assets/images/car.png',
        width: w,
        height: h,
        fit: BoxFit.cover,
      );
    }
  }
}
