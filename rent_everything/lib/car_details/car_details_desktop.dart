import 'package:flutter/material.dart';

class CarDetailsDesktop extends StatelessWidget {
  const CarDetailsDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
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
                    // Left Column - Image
                    Expanded(
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF6FF),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.directions_car,
                          size: 200,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Right Column - Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'BMW X5 2024',
                                  style: const TextStyle(
                                    color: darkText,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0F2FE),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  '4.8 ★',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '₹2,500 per day',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 28),
                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Premium luxury SUV with advanced features, comfortable seating for 5 passengers, and excellent fuel efficiency. Perfect for long drives and weekend trips.',
                            style: TextStyle(
                              color: greyText,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 28),
                          // Features
                          const Text(
                            'Features',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _featureRow('AC', '4 Seater', 'Automatic'),
                          const SizedBox(height: 12),
                          _featureRow('GPS', 'Bluetooth', 'Backup Camera'),
                          const SizedBox(height: 28),
                          // Host Info
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
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
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
                                        'Host since 2020',
                                        style: TextStyle(
                                          color: greyText,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.message_outlined,
                                    color: primaryColor,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          // Availability
                          const Text(
                            'Availability',
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
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: primaryColor,
                                  size: 24,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    'Available from 20 Aug - 30 Aug 2024',
                                    style: TextStyle(
                                      color: darkText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Book Button
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
                                'Book Now',
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

  Widget _featureRow(String feature1, String feature2, String feature3) {
    return Row(
      children: [
        _featureChip(feature1),
        const SizedBox(width: 12),
        _featureChip(feature2),
        const SizedBox(width: 12),
        _featureChip(feature3),
      ],
    );
  }

  Widget _featureChip(String feature) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE0F2FE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          feature,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
