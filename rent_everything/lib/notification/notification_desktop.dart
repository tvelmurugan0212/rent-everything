import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/desktop_drawer.dart';
import 'notification_controller.dart';

class NotificationDesktop extends StatelessWidget {
  const NotificationDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF687386);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return DesktopLayout(
      pageTitle: 'Notifications',
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(54, 48, 70, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Manage user notifications and announcements.',
                          style: TextStyle(color: greyText, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(6),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Row(
                        children: [
                          Icon(Icons.add, size: 25, color: primaryColor),
                          SizedBox(width: 18),
                          Text(
                            'Create',
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                          SizedBox(width: 14),
                          Text(
                            'Notification',
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Row(
                children: [
                  NotificationFilter(title: 'All', selected: true),
                  SizedBox(width: 30),
                  NotificationFilter(title: 'Renter'),
                  SizedBox(width: 30),
                  NotificationFilter(title: 'Booking'),
                  SizedBox(width: 30),
                  NotificationFilter(title: 'Payment'),
                  SizedBox(width: 30),
                  NotificationFilter(title: 'System'),
                ],
              ),
              const SizedBox(height: 34),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  }

                  if (controller.notifications.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notifications yet',
                        style: TextStyle(fontSize: 16, color: greyText),
                      ),
                    );
                  }

                  final notifications = controller.notifications;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 11,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: notifications.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 24),
                          itemBuilder: (context, index) {
                            final notification = notifications[index];

                            return NotificationCard(
                              title: notification['title'] ?? '',
                              message: notification['body'] ?? '',
                              time: controller.getTimeAgo(
                                notification['createdAt'],
                              ),
                              audience: notification['audience'] ?? 'Renters',
                              selected: index == 0,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        flex: 9,
                        child: NotificationDetailsCard(
                          notification: notifications.first,
                          controller: controller,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationFilter extends StatelessWidget {
  final String title;
  final bool selected;

  const NotificationFilter({
    super.key,
    required this.title,
    this.selected = false,
  });

  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 124,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.transparent,
        border: Border.all(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final String audience;
  final bool selected;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.audience,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(29, 28, 28, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: selected ? Border.all(color: const Color(0xFFE0E5EA)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                time,
                style: const TextStyle(color: Color(0xFF687386), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF202938), fontSize: 15),
          ),
          const SizedBox(height: 16),
          Text(
            audience,
            style: const TextStyle(color: Color(0xFF202938), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class NotificationDetailsCard extends StatelessWidget {
  final Map<String, dynamic> notification;
  final NotificationController controller;

  const NotificationDetailsCard({
    super.key,
    required this.notification,
    required this.controller,
  });

  static const Color darkText = Color(0xFF202938);
  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    final title = notification['title'] ?? 'Booking Reminder';
    final body =
        notification['body'] ?? 'Your rental starts tomorrow at 10 AM.';
    final audience = notification['audience'] ?? 'Renters';
    final createdAt = notification['createdAt'];

    String createdDate = '08 Aug 2026';

    if (createdAt != null) {
      final date = createdAt is DateTime
          ? createdAt
          : DateTime.tryParse(createdAt.toString());

      if (date != null) {
        createdDate =
            '${date.day.toString().padLeft(2, '0')} '
            '${_month(date.month)} ${date.year}';
      }
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 31, 30, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 27),
          const Text(
            'Audience',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(audience, style: const TextStyle(color: darkText, fontSize: 15)),
          const SizedBox(height: 27),
          const Text(
            'Message',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(body, style: const TextStyle(color: darkText, fontSize: 15)),
          const SizedBox(height: 27),
          const Text(
            'Created',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            createdDate,
            style: const TextStyle(color: darkText, fontSize: 15),
          ),
          const SizedBox(height: 27),
          const Text(
            'Status',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          const Text('Sent', style: TextStyle(color: darkText, fontSize: 15)),
          const SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 90,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text('Edit', style: TextStyle(fontSize: 15)),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 40,
                width: 110,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: const BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text('Delete', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _month(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return months[month - 1];
  }
}
