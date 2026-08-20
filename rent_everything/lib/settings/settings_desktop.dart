import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/desktop_drawer.dart';
import 'settings_controller.dart';

class SettingsDesktop extends StatelessWidget {
  const SettingsDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF111111);
  static const Color greyText = Color(0xFF6B7280);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return DesktopLayout(
      pageTitle: 'Settings',
      child: Container(
        color: backgroundColor,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 810,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(48, 44, 0, 40),
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage your platform preferences',
                  style: TextStyle(
                    color: greyText,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 44),
                const Text(
                  'General',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 22),
                const SettingsGroup(
                  children: [
                    SettingsArrowRow(title: 'Platform Name'),
                    SettingsArrowRow(title: 'Language'),
                    SettingsArrowRow(title: 'Currency'),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Notifications',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 22),
                SettingsGroup(
                  children: [
                    Obx(
                      () => SettingsSwitchRow(
                        title: 'Email Notifications',
                        value: controller.emailNotifications.value,
                        onChanged: controller.toggleEmail,
                      ),
                    ),
                    Obx(
                      () => SettingsSwitchRow(
                        title: 'Booking Notifications',
                        value: controller.bookingNotifications.value,
                        onChanged: controller.toggleBooking,
                      ),
                    ),
                    Obx(
                      () => SettingsSwitchRow(
                        title: 'Payment Notifications',
                        value: controller.paymentNotifications.value,
                        onChanged: controller.togglePayment,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Security',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 22),
                const SettingsGroup(
                  children: [
                    SettingsArrowRow(title: 'Change Password'),
                    SettingsArrowRow(title: 'Two-Factor Auth'),
                    SettingsArrowRow(title: 'Payment Notifications'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsGroup extends StatelessWidget {
  final List<Widget> children;

  const SettingsGroup({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(children: children),
    );
  }
}

class SettingsArrowRow extends StatelessWidget {
  final String title;

  const SettingsArrowRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: const EdgeInsets.symmetric(horizontal: 26),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 22,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class SettingsSwitchRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: const EdgeInsets.symmetric(horizontal: 26),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.78,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: const Color(0xFF2FC45B),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFD1D5DB),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
