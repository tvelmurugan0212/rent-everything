import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/rental_cards.dart';
import 'wishlist_controller.dart';

class WishlistMobile extends StatelessWidget {
  const WishlistMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Wishlist',
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
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }

                if (controller.wishlistProducts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: 60,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'No wishlist items yet',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Tap the heart icon on any rental to add it here',
                          style: TextStyle(
                            fontSize: 13,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  itemCount: controller.wishlistProducts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final product = controller.wishlistProducts[index];
                    final String imageUrl =
                        WishlistController.getImageUrl(product);
                    final String name =
                        product['productName'] ?? 'Untitled';
                    final double price =
                        (product['rentalPrice'] ?? 0).toDouble();
                    final String city =
                        product['pickupCity'] ?? 'Unknown';
                    final String productId = product['id'] ?? '';

                    return RentalCard(
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
                      isFavorite: true,
                      onFavorite: () {
                        controller.removeFromWishlist(productId);
                      },
                      onpress: () {
                        Get.toNamed('/details',
                            arguments: {'id': productId});
                      },
                      onRentNow: () {
                        Get.toNamed('/booking-summary',
                            arguments: {'id': productId});
                      },
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
}
