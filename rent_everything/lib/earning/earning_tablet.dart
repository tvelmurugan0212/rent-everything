import 'package:flutter/material.dart';

class EarningTablet extends StatelessWidget {
  const EarningTablet({super.key});

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
          'Earnings',
          style: TextStyle(
            color: darkText,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 700,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // Earnings Summary Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0674A1), Color(0xFF0554A0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Earnings',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '₹18,540',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'This Month',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '₹5,200',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Pending',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '₹800',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Recent Earnings
                const Text(
                  'Recent Earnings',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                const EarningItemCard(
                  title: 'Royal Enfield Classic 350',
                  amount: '₹1,200',
                  date: '18 Aug 2024',
                  status: 'Completed',
                  icon: Icons.two_wheeler,
                ),
                const SizedBox(height: 12),
                const EarningItemCard(
                  title: 'Canon EOS R50 Camera',
                  amount: '₹1,800',
                  date: '17 Aug 2024',
                  status: 'Completed',
                  icon: Icons.camera_alt,
                ),
                const SizedBox(height: 12),
                const EarningItemCard(
                  title: 'MacBook Pro 14',
                  amount: '₹2,500',
                  date: '16 Aug 2024',
                  status: 'Pending',
                  icon: Icons.laptop,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EarningItemCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final String status;
  final IconData icon;

  const EarningItemCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted = status == 'Completed';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF0674A1), size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF0674A1),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isCompleted
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFF57C00),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
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
