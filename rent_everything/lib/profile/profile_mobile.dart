// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================================================
              // TOP BAR
              // =========================================================
              SizedBox(
                height: 48,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // =========================================================
              // PROFILE
              // =========================================================
              const SizedBox(height: 22),

              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Name + edit icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Jack',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(width: 8),

                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.edit,
                            size: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      'Vellore, Tamil Nadu',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),

              // =========================================================
              // MY ACTIVITY
              // =========================================================
              const SizedBox(height: 34),

              const Text(
                'My Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 12),

              _sectionCard(
                children: [
                  _profileTile(
                    title: 'Wishlist',
                    onTap: () {
                      Get.toNamed('/wishlist');
                    },
                  ),
                  _profileTile(
                    title: 'Earnings',
                    onTap: () {
                      Get.toNamed('/earnings');
                    },
                  ),
                  _profileTile(
                    title: 'Reviews',
                    onTap: () {
                      Get.toNamed('/review');
                    },
                  ),
                ],
              ),

              // =========================================================
              // ACCOUNT
              // =========================================================
              const SizedBox(height: 24),

              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 12),

              _sectionCard(
                children: [
                  _profileTile(
                    title: 'Notifications',
                    onTap: () {
                      Get.toNamed('/notifications');
                    },
                  ),
                  _profileTile(
                    title: 'Settings',
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                  _profileTile(title: 'Payment Methods', onTap: () {}),
                ],
              ),

              // =========================================================
              // SUPPORT
              // =========================================================
              const SizedBox(height: 24),

              const Text(
                'Support',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 12),

              _sectionCard(
                children: [_profileTile(title: 'Help & Support', onTap: () {})],
              ),

              // =========================================================
              // LOGOUT
              // =========================================================
              const SizedBox(height: 27),

              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 22,
                          color: Color(0xFFFF3B30),
                        ),

                        SizedBox(width: 17),

                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFF3B30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // SECTION CARD
  // ========================================================================

  static Widget _sectionCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // ========================================================================
  // PROFILE TILE
  // ========================================================================

  static Widget _profileTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 40,
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

              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
                color: Color(0xFF5D5D5D),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
