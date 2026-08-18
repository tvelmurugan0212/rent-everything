import 'package:flutter/material.dart';

class NotificationTablet extends StatelessWidget {
  const NotificationTablet({super.key});

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
          'Notifications',
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
              children: const [
                NotificationItemCard(
                  title: 'Booking Confirmed',
                  subtitle: 'Your rental booking has been confirmed',
                  time: '2 hours ago',
                  icon: Icons.check_circle,
                  read: false,
                ),
                SizedBox(height: 14),
                NotificationItemCard(
                  title: 'Rental Return Due',
                  subtitle: 'Return your Royal Enfield by tomorrow',
                  time: '5 hours ago',
                  icon: Icons.schedule,
                  read: false,
                ),
                SizedBox(height: 14),
                NotificationItemCard(
                  title: 'Payment Received',
                  subtitle: '₹1,200 payment received for your booking',
                  time: '1 day ago',
                  icon: Icons.payment,
                  read: true,
                ),
                SizedBox(height: 14),
                NotificationItemCard(
                  title: 'New Offer Available',
                  subtitle: 'Get 20% off on bike rentals this weekend',
                  time: '2 days ago',
                  icon: Icons.local_offer,
                  read: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final bool read;

  const NotificationItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.read,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: read ? Colors.white : const Color(0xFFEAF6FF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: read
              ? Colors.transparent
              : const Color(0xFF0674A1).withAlpha(51),
          width: 1,
        ),
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
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (!read)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF0674A1),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
