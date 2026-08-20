import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationTablet extends StatelessWidget {
  const NotificationTablet({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

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
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.notifications.isEmpty) {
                return const Center(
                  child: Text(
                    'No notifications yet',
                    style: TextStyle(fontSize: 16, color: greyText),
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  final isRead = notification['isRead'] ?? false;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: NotificationItemCard(
                      title: notification['title'] ?? '',
                      subtitle: notification['body'] ?? '',
                      time: controller.getTimeAgo(notification['createdAt']),
                      icon: Icons.notifications,
                      read: isRead,
                    ),
                  );
                },
              );
            }),
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
