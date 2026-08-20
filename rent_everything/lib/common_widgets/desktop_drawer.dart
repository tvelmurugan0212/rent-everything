// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopLayout extends StatelessWidget {
  final Widget child;
  final String pageTitle;

  const DesktopLayout({
    super.key,
    required this.child,
    required this.pageTitle,
  });

  static const Color primaryColor = Color(0xFF0674A1);

  static const List<String> drawerRoutes = [
    '/home',
    '/profile',
    '',
    '/categories',
    '',
    '/earnings',
    '',
    '/notifications',
    '/settings',
  ];

  static int selectedIndexFromRoute(String route) {
    for (int i = 0; i < drawerRoutes.length; i++) {
      if (drawerRoutes[i].isNotEmpty && route.startsWith(drawerRoutes[i])) {
        return i;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = selectedIndexFromRoute(Get.currentRoute);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Row(
        children: [
          // =========================
          // LEFT DRAWER
          // =========================
          DesktopDrawer(
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              final route = drawerRoutes[index];
              if (route.isNotEmpty && Get.currentRoute != route) {
                Get.offAllNamed(route);
              }
            },
            onLogout: () {
              // Logout logic
            },
          ),

          // =========================
          // RIGHT SIDE
          // =========================
          Expanded(
            child: Column(
              children: [
                // TOP HEADER
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(width: 48),

                      // Search
                      Expanded(
                        child: Center(
                          child: Container(
                            width: 365,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFD1D5DB),
                              ),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const TextField(
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB5B5B5),
                                  fontSize: 14,
                                ),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  size: 22,
                                  color: Color(0xFF8B8B8B),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Admin
                      Padding(
                        padding: const EdgeInsets.only(right: 42),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xFFE5E7EB),
                              backgroundImage: const AssetImage(
                                'assets/images/profile.png',
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Admin',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // PAGE CONTENT
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// COMMON DRAWER
// ============================================================

class DesktopDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onLogout;

  const DesktopDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onLogout,
  });

  static const Color primaryColor = Color(0xFF0674A1);

  static const List<_DrawerItem> drawerItems = [
    _DrawerItem(title: 'Dashboard', icon: Icons.grid_view_rounded),
    _DrawerItem(title: 'Users', icon: Icons.person_outline_rounded),
    _DrawerItem(title: 'Products', icon: Icons.manage_search_rounded),
    _DrawerItem(title: 'Categories', icon: Icons.category_outlined),
    _DrawerItem(title: 'Bookings', icon: Icons.home_work_outlined),
    _DrawerItem(title: 'Payments', icon: Icons.account_balance_wallet_outlined),
    _DrawerItem(title: 'Reports', icon: Icons.description_outlined),
    _DrawerItem(title: 'Notifications', icon: Icons.notifications_none_rounded),
    _DrawerItem(title: 'Settings', icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222,
      color: Colors.white,
      child: Column(
        children: [
          // =================================
          // LOGO
          // =================================
          SizedBox(
            height: 100,
            child: Row(
              children: [
                const SizedBox(width: 26),

                Container(
                  width: 62,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'R',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'serif',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                const Text(
                  'Rent Everything',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // =================================
          // MENU
          // =================================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 17,
                right: 17,
                top: 37,
                bottom: 20,
              ),
              child: Column(
                children: [
                  ...List.generate(drawerItems.length, (index) {
                    final item = drawerItems[index];
                    final selected = index == selectedIndex;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => onItemSelected(index),
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          height: 37,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: selected ? primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item.icon,
                                size: 20,
                                color: selected ? Colors.white : Colors.black,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const Spacer(),

                  // LOGOUT
                  InkWell(
                    onTap: onLogout,
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: Colors.red,
                            size: 21,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Logout',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final String title;
  final IconData icon;

  const _DrawerItem({required this.title, required this.icon});
}
