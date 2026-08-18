import 'package:flutter/material.dart';

class BookingSummaryTablet extends StatelessWidget {
  const BookingSummaryTablet({super.key});

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
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 700,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rental Item Card
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF6FF),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.directions_car,
                              color: primaryColor,
                              size: 48,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'BMW X5 2024',
                                  style: TextStyle(
                                    color: darkText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Premium SUV',
                                  style: TextStyle(
                                    color: greyText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Rental Period
                    const Text(
                      'Rental Period',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_today,
                                color: primaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Check-in: 20 Aug 2024',
                                style: TextStyle(
                                  color: darkText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_today,
                                color: primaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Check-out: 25 Aug 2024',
                                style: TextStyle(
                                  color: darkText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              Icon(
                                Icons.access_time,
                                color: primaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Text(
                                '5 days',
                                style: TextStyle(
                                  color: greyText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Host Information
                    const Text(
                      'Host Information',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0xFFE0F2FE),
                            child: const Text(
                              'RK',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Rajesh Kumar',
                                  style: TextStyle(
                                    color: darkText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '4.8 ★ (245 reviews)',
                                  style: TextStyle(
                                    color: greyText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Price Breakdown
                    const Text(
                      'Price Breakdown',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          _priceRow('Daily Rate (5 days)', '₹12,500'),
                          const SizedBox(height: 12),
                          _priceRow('Delivery Charges', '₹500'),
                          const SizedBox(height: 12),
                          _priceRow('Insurance', '₹1,000'),
                          const Divider(height: 16),
                          _priceRow('Total Amount', '₹14,000', isBold: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Confirm Booking Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Confirm Booking',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: isBold ? primaryColor : darkText,
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
