// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class EarningMobile extends StatelessWidget {
  const EarningMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.only(left: 12),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Earning',
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
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      // height: 228,
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 15),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Earnings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '₹45,200',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: _summaryCard(
                            title: "Today's Earnings",
                            value: '₹2,500',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _summaryCard(
                            title: 'This Month',
                            value: '₹9,500',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _summaryCard(
                            title: 'Pending Payout',
                            value: '₹6,000',
                          ),
                        ),

                        const SizedBox(width: 15),
                        Expanded(
                          child: _summaryCard(
                            title: 'Total Rentals',
                            value: '24',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Recent Earnings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const EarningItemCard(
                      title: 'Toyota Innova Crysta',
                      rental: 'Rental: 08 Aug – 10 Aug',
                      amount: '+ ₹2,500',
                      status: 'Completed',
                    ),
                    const SizedBox(height: 18),
                    const EarningItemCard(
                      title: 'Sony Camera',
                      rental: 'Rental: 06 Aug – 07 Aug',
                      amount: '+ ₹500',
                      status: 'Completed',
                    ),
                    const SizedBox(height: 18),
                    const EarningItemCard(
                      title: 'Toyota Innova Crysta',
                      rental: 'Rental: 04 Aug – 06 Aug',
                      amount: '+ ₹1,800',
                      status: 'Completed',
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

  static Widget _summaryCard({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 18, 10, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 12,
            offset: const Offset(0, 6),
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
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class EarningItemCard extends StatelessWidget {
  final String title;
  final String rental;
  final String amount;
  final String status;

  const EarningItemCard({
    super.key,
    required this.title,
    required this.rental,
    required this.amount,
    required this.status,
  });

  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
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
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            rental,
            style: const TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            amount,
            style: const TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            status,
            style: const TextStyle(
              color: greyText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
