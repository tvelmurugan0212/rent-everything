import 'package:flutter/material.dart';

class NotificationMobile extends StatelessWidget {
  const NotificationMobile({super.key});

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
              height: 55,
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
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),

                      _filterButton(title: 'All', selected: true, width: 60),

                      const SizedBox(width: 12),

                      _filterButton(
                        title: 'Renter',
                        selected: false,
                        width: 83,
                      ),

                      const SizedBox(width: 12),

                      _filterButton(
                        title: 'Lender',
                        selected: false,
                        width: 86,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  _notificationItem(
                    image: 'assets/images/profile.png',
                    title: 'Booking Confirmed',
                    message: 'Your iPhone 16 Pro booking has been co...',
                    time: '2 min ago',
                  ),
                  _notificationItem(
                    image: 'assets/images/profile2.png',
                    title: 'Payment Successful',
                    message: 'Your payment of ₹2,700 was successful.',
                    time: '29 min ago',
                    highlighted: true,
                  ),
                  _notificationItem(
                    image: 'assets/images/profile3.png',
                    title: 'Pickup Reminder',
                    message: 'Your rental starts tomorrow at 10:00 AM.',
                    time: '30 min ago',
                  ),
                  _notificationItem(
                    image: 'assets/images/profile4.png',
                    title: 'Wishlist Update',
                    message: 'A saved product is now available.',
                    time: '45 min ago',
                  ),
                  _notificationItem(
                    image: 'assets/images/profile5.png',
                    title: 'Pickup Reminder',
                    message: 'Your rental starts tomorrow at 10:00 AM.',
                    time: '1 hours ago',
                  ),
                  _notificationItem(
                    image: 'assets/images/profile6.png',
                    title: 'Booking Confirmed',
                    message: 'Your iPhone 16 Pro booking has been co...',
                    time: '1 hours ago',
                    highlighted: true,
                  ),
                  _notificationItem(
                    image: 'assets/images/profile7.png',
                    title: 'Booking Confirmed',
                    message: 'Your iPhone 16 Pro booking has been co...',
                    time: '2 hours ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _filterButton({
    required String title,
    required bool selected,
    required double width,
  }) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: selected
            ? null
            : Border.all(color: const Color(0xFF8C8C8C), width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: selected ? Colors.white : const Color(0xFF858585),
        ),
      ),
    );
  }

  static Widget _notificationItem({
    required String image,
    required String title,
    required String message,
    required String time,
    bool highlighted = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: highlighted ? const Color(0xFFF0F0F0) : Colors.white,
        border: const Border(
          bottom: BorderSide(color: Color(0xFFC8C8C8), width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                image,
                width: 34,
                height: 34,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E7EB),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 22,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: darkText,
                    ),
                  ),
                  // const SizedBox(height: 8),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: greyText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
