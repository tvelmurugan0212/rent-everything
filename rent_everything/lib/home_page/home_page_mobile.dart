// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/add.dart';
import 'screens/booking/booking.dart';
import 'screens/dashboard.dart';
import 'screens/product/product.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  // =============================================================
  // SELECTED BOTTOM TAB
  // =============================================================

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
                    HomeContent(),
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

        // =========================================================
        // FLOATING BOTTOM NAVIGATION
        // =========================================================
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

  // =============================================================
  // BOTTOM NAVIGATION BAR
  // =============================================================

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

  // =============================================================
  // BOTTOM ITEM
  // =============================================================

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

// ============================================================================
// HOME CONTENT
// ============================================================================

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // =============================================================
        // BLUE HEADER
        // =============================================================
        Container(
          color: HomePageMobile.primaryColor,
          child: Column(
            children: [
              const SizedBox(height: 20),

              // -------------------------------------------------------
              // PROFILE HEADER
              // -------------------------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 11),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi Jack',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Vellore',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 29,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              // -------------------------------------------------------
              // SEARCH
              // -------------------------------------------------------
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                      suffixIcon: Icon(
                        Icons.mic_none_rounded,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 23),
            ],
          ),
        ),

        // =============================================================
        // WHITE CONTENT
        // =============================================================
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 27, bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===================================================
                  // BANNER
                  // ===================================================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        width: double.infinity,
                        height: 163,
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // ===================================================
                  // DOTS
                  // ===================================================
                  const SizedBox(height: 21),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(active: true),
                      _buildDot(),
                      _buildDot(),
                      _buildDot(),
                      _buildDot(),
                    ],
                  ),

                  // ===================================================
                  // CATEGORIES
                  // ===================================================
                  const SizedBox(height: 28),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: HomePageMobile.darkText,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===================================================
                  // CATEGORY LIST
                  // ===================================================
                  const SizedBox(height: 25),

                  SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _categoryCard(
                          image: 'assets/images/bike.png',
                          title: 'Bike',
                        ),
                        _categoryCard(
                          image: 'assets/images/car.png',
                          title: 'Car',
                        ),
                        _categoryCard(
                          image: 'assets/images/camera.png',
                          title: 'Camera',
                        ),
                        _categoryCard(
                          image: 'assets/images/camera.png',
                          title: 'Laptop',
                        ),
                      ],
                    ),
                  ),

                  // ===================================================
                  // RECOMMENDED RENTALS
                  // ===================================================
                  const SizedBox(height: 30),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Recommended Rentals',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: HomePageMobile.darkText,
                      ),
                    ),
                  ),

                  const SizedBox(height: 27),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _rentalCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =============================================================
  // DOT
  // =============================================================

  static Widget _buildDot({bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? HomePageMobile.primaryColor : const Color(0xFFE7E2DA),
      ),
    );
  }

  // =============================================================
  // CATEGORY CARD
  // =============================================================

  static Widget _categoryCard({required String image, required String title}) {
    return Container(
      width: 107,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
      child: Column(
        children: [
          Container(
            height: 91,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF0ECE6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // RENTAL CARD
  // =============================================================

  static Widget _rentalCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 9,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 155,
            child: Image.asset('assets/images/car.png', fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(11, 17, 5, 13),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'Toyota Innova Crysta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: HomePageMobile.darkText,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red.shade500,
                        size: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 11),

                const Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFD000), size: 19),
                    SizedBox(width: 6),
                    Text(
                      '4.8 (124 reviews)',
                      style: TextStyle(
                        fontSize: 14,
                        color: HomePageMobile.darkText,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 19,
                      color: Colors.black,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'Vellore • 2 km',
                      style: TextStyle(
                        fontSize: 14,
                        color: HomePageMobile.darkText,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(
                      Icons.currency_rupee,
                      size: 18,
                      color: Colors.black,
                    ),

                    const SizedBox(width: 7),

                    const Expanded(
                      child: Text(
                        '2,500/day',
                        style: TextStyle(
                          fontSize: 14,
                          color: HomePageMobile.darkText,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                Row(
                  children: [
                    const Icon(Icons.done, size: 19, color: Colors.black),

                    const SizedBox(width: 7),

                    const Expanded(
                      child: Text(
                        'Available Today',
                        style: TextStyle(
                          fontSize: 14,
                          color: HomePageMobile.darkText,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 151,
                      height: 41,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HomePageMobile.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Rent Now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// PRODUCTS
// ============================================================================
