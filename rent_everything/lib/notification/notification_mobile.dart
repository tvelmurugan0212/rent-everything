import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationMobile extends StatelessWidget {
  const NotificationMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

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
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    final isRead = notification['isRead'] ?? false;
                    return _notificationItem(
                      title: notification['title'] ?? '',
                      message: notification['body'] ?? '',
                      time: controller.getTimeAgo(notification['createdAt']),
                      highlighted: !isRead,
                    );
                  },
                );
              }),
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
              child: Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xFFE0F2FE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Color(0xFF0674A1),
                  size: 20,
                ),
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
