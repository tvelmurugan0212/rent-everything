// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/add/add.dart';
import 'screens/booking/booking.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/home/home.dart';
import 'screens/product/product.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  static final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,

        // =========================================================
        // BODY
        // =========================================================
        body: Container(
          color: primaryColor,
          child: SafeArea(
            bottom: false,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, index, child) {
                return IndexedStack(
                  index: index,
                  children: [
                    Home(),
                    DashboardPage(),
                    AddPage(),
                    Booking(),
                    ProductsPage(),
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: _bottomNavigationBar(),
          ),
        ),
      ),
    );
  }

  static Widget _bottomNavigationBar() {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          _bottomItem(icon: Icons.home_outlined, label: 'Home', index: 0),
          _bottomItem(
            icon: Icons.grid_view_rounded,
            label: 'Dashboard',
            index: 1,
          ),
          _bottomItem(icon: Icons.add, label: 'Add', index: 2),
          _bottomItem(icon: Icons.article_outlined, label: 'Booking', index: 3),
          _bottomItem(icon: Icons.layers_outlined, label: 'Products', index: 4),
        ],
      ),
    );
  }

  static Widget _bottomItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return Expanded(
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, currentIndex, child) {
          final bool selected = currentIndex == index;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              selectedIndex.value = index;
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 31,
                    height: 31,
                    decoration: selected
                        ? const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          )
                        : null,
                    child: Icon(
                      icon,
                      size: 21,
                      color: selected ? primaryColor : Colors.white,
                    ),
                  ),

                  const SizedBox(height: 1),

                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
