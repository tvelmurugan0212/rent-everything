import 'package:flutter/material.dart';

class BookingSummaryDesktop extends StatelessWidget {
  const BookingSummaryDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Booking Summary',
          style: TextStyle(
            color: darkText,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Rental Item Card
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEAF6FF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.directions_car,
                                    color: primaryColor,
                                    size: 60,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'BMW X5 2024',
                                        style: TextStyle(
                                          color: darkText,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Premium SUV',
                                        style: TextStyle(
                                          color: greyText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Host Information
                          const Text(
                            'Host Information',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: const Color(0xFFE0F2FE),
                                  child: const Text(
                                    'RK',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Rajesh Kumar',
                                        style: TextStyle(
                                          color: darkText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        '4.8 ★ (245 reviews)',
                                        style: TextStyle(
                                          color: greyText,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Right Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Rental Period
                          const Text(
                            'Rental Period',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.calendar_today,
                                      color: primaryColor,
                                      size: 22,
                                    ),
                                    SizedBox(width: 14),
                                    Text(
                                      'Check-in: 20 Aug 2024',
                                      style: TextStyle(
                                        color: darkText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.calendar_today,
                                      color: primaryColor,
                                      size: 22,
                                    ),
                                    SizedBox(width: 14),
                                    Text(
                                      'Check-out: 25 Aug 2024',
                                      style: TextStyle(
                                        color: darkText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                      size: 22,
                                    ),
                                    SizedBox(width: 14),
                                    Text(
                                      '5 days',
                                      style: TextStyle(
                                        color: greyText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Price Breakdown
                          const Text(
                            'Price Breakdown',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                _priceRow('Daily Rate (5 days)', '₹12,500'),
                                const SizedBox(height: 14),
                                _priceRow('Delivery Charges', '₹500'),
                                const SizedBox(height: 14),
                                _priceRow('Insurance', '₹1,000'),
                                const Divider(height: 20),
                                _priceRow(
                                  'Total Amount',
                                  '₹14,000',
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          // Confirm Booking Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Confirm Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _priceRow(String label, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: greyText,
            fontSize: 16,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: isBold ? primaryColor : darkText,
            fontSize: 16,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
