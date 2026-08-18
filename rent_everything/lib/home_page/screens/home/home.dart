// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/rental_cards.dart';
import '../../home_page_mobile.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());

  final PageController pageController = PageController();

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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/profile');
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 44,
                          height: 44,
                          fit: BoxFit.cover,
                        ),
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

                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/notifications');
                      },
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        size: 29,
                        color: Colors.white,
                      ),
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
              padding: const EdgeInsets.only(top: 20, bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 130,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: controller.changeBanner,
                        children: [
                          _banner('assets/images/banner.png'),
                          _banner('assets/images/banner.png'),
                          _banner('assets/images/banner.png'),
                          _banner('assets/images/banner.png'),
                          _banner('assets/images/banner.png'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(active: controller.bannerIndex.value == 0),
                        _buildDot(active: controller.bannerIndex.value == 1),
                        _buildDot(active: controller.bannerIndex.value == 2),
                        _buildDot(active: controller.bannerIndex.value == 3),
                        _buildDot(active: controller.bannerIndex.value == 4),
                      ],
                    ),
                  ),
                  // ===================================================
                  // CATEGORIES
                  // ===================================================
                  const SizedBox(height: 18),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: HomePageMobile.darkText,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/categories');
                          },
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

                  // const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
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

                  const SizedBox(height: 30),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Recommended Rentals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: HomePageMobile.darkText,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Obx(() {
                    if (controller.isLoadingProducts.value) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: CircularProgressIndicator(
                            color: HomePageMobile.primaryColor,
                          ),
                        ),
                      );
                    }

                    if (controller.products.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Icon(
                                Icons.car_rental,
                                size: 50,
                                color: HomePageMobile.greyText,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'No products available yet',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: HomePageMobile.greyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: controller.products.map((product) {
                        final String imageUrl = HomeController.getImageUrl(
                          product,
                        );
                        final String name =
                            product['productName'] ?? 'Untitled';
                        final double price = (product['rentalPrice'] ?? 0)
                            .toDouble();
                        final String city = product['pickupCity'] ?? 'Unknown';

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: RentalCard(
                              image: imageUrl.isNotEmpty
                                  ? imageUrl
                                  : 'assets/images/car.png',
                              title: name,
                              rating: '4.8',
                              reviews: '0',
                              location: city,
                              distance: '0 km',
                              price: '${price.toStringAsFixed(0)}/day',
                              availability: 'Available',
                              onpress: () {
                                Get.toNamed(
                                  '/details',
                                  arguments: {'id': product['id']},
                                );
                              },
                              onRentNow: () {
                                Get.toNamed(
                                  '/booking-summary',
                                  arguments: {'id': product['id']},
                                );
                              },
                              onFavorite: () {},
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _banner(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        image,
        width: double.infinity,
        height: 133,
        fit: BoxFit.cover,
      ),
    );
  }

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

  static Widget _categoryCard({required String image, required String title}) {
    return Container(
      width: 97,
      height: 116,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 9,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
      child: Column(
        children: [
          Container(
            height: 81,
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
}
