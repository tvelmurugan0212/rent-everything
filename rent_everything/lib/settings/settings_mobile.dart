// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsMobile extends StatelessWidget {
  const SettingsMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 54,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.only(left: 8),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Settings',
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                children: [
                  const Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _sectionCard(
                    children: [
                      _settingsTile(title: 'Language', onTap: () {}),
                      _settingsTile(
                        title: 'Dark Mode',
                        trailing: Obx(
                          () => Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              padding: EdgeInsets.zero,
                              value: controller.darkMode.value,
                              onChanged: controller.toggleDarkMode,
                              activeColor: Colors.white,
                              activeTrackColor: const Color(0xFF2FC45B),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: const Color(0xFFD1D5DB),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      ),
                      _settingsTile(
                        title: 'Notification Settings',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Privacy & Security',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _sectionCard(
                    children: [
                      _settingsTile(title: 'Privacy Policy', onTap: () {}),
                      _settingsTile(title: 'Terms & Conditions', onTap: () {}),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _sectionCard(
                    children: [
                      _settingsTile(title: 'About App', onTap: () {}),
                      _settingsTile(title: 'Rate App', onTap: () {}),
                      _settingsTile(title: 'Share App', onTap: () {}),
                    ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _sectionCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  static Widget _settingsTile({
    required String title,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return SizedBox(
      height: 35,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: greyText,
                  ),
                ),
              ),
              trailing ??
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 17,
                    color: greyText,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
