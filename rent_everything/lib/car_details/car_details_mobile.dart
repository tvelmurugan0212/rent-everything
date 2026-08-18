// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'car_details_controller.dart';

class CarDetailsMobile extends StatelessWidget {
  const CarDetailsMobile({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          if (controller.product.value == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text('Product not found',
                      style: TextStyle(fontSize: 16, color: greyText)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    child: const Text('Go Back', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 105),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Top Bar ---
                    SizedBox(
                      height: 52,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              padding: const EdgeInsets.only(left: 10),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            right: 8,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: controller.toggleWishlist,
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    controller.isWishlist
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,
                                    size: 21,
                                    color: controller.isWishlist
                                        ? Colors.red
                                        : const Color(0xFF333333),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    size: 21,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // --- Image ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: SizedBox(
                          width: double.infinity,
                          height: 210,
                          child: PageView.builder(
                            controller: controller.imageController,
                            itemCount: 1,
                            onPageChanged: controller.onImageChanged,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CarDetailsController.buildImage(
                                controller.imageUrl,
                                width: double.infinity,
                                height: 210,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(1, (index) {
                            final isActive =
                                controller.currentImage.value == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: isActive ? 10 : 8,
                              height: 10,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isActive
                                    ? primaryColor
                                    : const Color(0xFFEDE9E3),
                              ),
                            );
                          }),
                        )),

                    const SizedBox(height: 30),

                    // --- Product Info ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.productName,
                            style: const TextStyle(
                              color: darkText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 12),

                          _infoRow(
                            icon: Icons.star_rounded,
                            iconColor: const Color(0xFFFFD000),
                            text: '4.9 (126 Reviews)',
                          ),

                          const SizedBox(height: 8),

                          _infoRow(
                            icon: Icons.location_on_outlined,
                            text: '${controller.city}, Tamil Nadu',
                          ),

                          const SizedBox(height: 8),

                          _infoRow(
                            icon: Icons.category_outlined,
                            text:
                                '${controller.brand} • ${controller.category}',
                          ),

                          const SizedBox(height: 18),

                          const Divider(
                              height: 1, color: Color(0xFFD8D8D8)),

                          const SizedBox(height: 18),

                          const Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '₹${controller.rentalPrice.toStringAsFixed(0)}/day',
                            style:
                                const TextStyle(color: greyText, fontSize: 16),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Security Deposit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '₹${controller.securityDeposit.toStringAsFixed(0)} (Refundable)',
                            style:
                                const TextStyle(color: greyText, fontSize: 16),
                          ),

                          const SizedBox(height: 18),

                          const Divider(
                              height: 1, color: Color(0xFFD8D8D8)),

                          const SizedBox(height: 18),

                          const Text(
                            'Product Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            controller.description,
                            style: const TextStyle(
                              color: greyText,
                              fontSize: 16,
                              height: 1.45,
                            ),
                          ),

                          const SizedBox(height: 20),

                          if (controller.condition.isNotEmpty) ...[
                            const Text(
                              'Condition',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.condition,
                              style: const TextStyle(
                                color: greyText,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // --- Bottom Bar ---
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 85,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Per Day',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '₹${controller.rentalPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: darkText,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/booking-summary',
                                  arguments: {'id': controller.productId});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  static Widget _infoRow({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: greyText, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
