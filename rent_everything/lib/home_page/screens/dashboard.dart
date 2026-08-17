// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const Color primaryColor = Color(0xFF087FA8);
  static const Color darkText = Color(0xFF1F2937);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================================================
              // DASHBOARD TITLE
              // =========================================================
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              // =========================================================
              // BUSINESS OVERVIEW
              // =========================================================
              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Business Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
              ),

              // =========================================================
              // OVERVIEW CARDS
              // =========================================================
              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _overviewCard(
                        title: 'Active Products',
                        value: '24',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _overviewCard(
                        title: 'Pending Requests',
                        value: '5',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _overviewCard(
                        title: 'Total Earnings',
                        value: '₹63,000',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _overviewCard(
                        title: 'Average Rating',
                        value: '4.8',
                      ),
                    ),
                  ],
                ),
              ),

              // =========================================================
              // RECENT BOOKING REQUESTS
              // =========================================================
              const SizedBox(height: 50),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recent Booking Requests',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
              ),

              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 12,
                    bottom: 12,
                  ),
                  children: [
                    _bookingCard(
                      title: 'Canon Camera',
                      price: '₹ 900/day',
                      date: 'Today',
                    ),
                    _bookingCard(
                      title: 'Toyota Innova',
                      price: '₹ 1200/day',
                      date: 'Yesterday',
                    ),
                    _bookingCard(
                      title: 'Canon Camera',
                      price: '₹ 900/day',
                      date: 'Yesterday',
                    ),
                  ],
                ),
              ),
              // =========================================================
              // RECENT EARNINGS
              // =========================================================
              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recent Earnings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _earningsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =======================================================================
  // BUSINESS OVERVIEW CARD
  // =======================================================================

  static Widget _overviewCard({required String title, required String value}) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // =======================================================================
  // BOOKING REQUEST CARD
  // =======================================================================
  static Widget _bookingCard({
    required String title,
    required String price,
    required String date,
  }) {
    return Container(
      width: 200,
      height: 140,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: darkText,
            ),
          ),

          const Spacer(),

          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),
        ],
      ),
    );
  }

  // =======================================================================
  // RECENT EARNINGS CARD
  // =======================================================================

  static Widget _earningsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
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
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: darkText,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Rahul Kumar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 42,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: primaryColor, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(fontSize: 14, color: Colors.white),
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
