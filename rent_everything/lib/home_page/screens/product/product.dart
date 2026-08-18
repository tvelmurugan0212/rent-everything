// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'products_controller.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // =========================================================
            // SEARCH BAR
            // =========================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller.searchController,
                  onChanged: controller.onSearchChanged,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(fontSize: 14, color: darkText),
                  decoration: InputDecoration(
                    hintText: 'Search by name, category, brand, city',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF85858A),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Color(0xFF85858A),
                    ),
                    suffixIcon: Obx(() {
                      if (controller.searchQuery.value.isEmpty) {
                        return const Icon(
                          Icons.mic_none,
                          size: 20,
                          color: Color(0xFF85858A),
                        );
                      }
                      return IconButton(
                        icon: const Icon(
                          Icons.clear,
                          size: 20,
                          color: Color(0xFF85858A),
                        ),
                        onPressed: () {
                          controller.searchController.clear();
                          controller.onSearchChanged('');
                        },
                      );
                    }),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // =========================================================
            // PRODUCT LIST
            // =========================================================
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }

                if (controller.filteredProducts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          controller.searchQuery.value.isEmpty
                              ? 'No products available yet'
                              : 'No products found',
                          style: const TextStyle(
                            fontSize: 14,
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
                      horizontal: 16, vertical: 12),
                  itemCount: controller.filteredProducts.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final product =
                        controller.filteredProducts[index];

                    final String productId =
                        product['id'] ?? '';
                    final String imageUrl =
                        product['imageUrl'] ?? '';
                    final String name =
                        product['productName'] ?? 'Untitled';
                    final double price =
                        (product['rentalPrice'] ?? 0).toDouble();
                    final String city =
                        product['pickupCity'] ?? 'Unknown';
                    final String category =
                        product['category'] ?? '';
                    final String brand =
                        product['brand'] ?? '';

                    return _productCard(
                      productId: productId,
                      imageUrl: imageUrl,
                      productName: name,
                      price: '${price.toStringAsFixed(0)}/day',
                      location: city,
                      category: category,
                      brand: brand,
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

  // =======================================================================
  // PRODUCT CARD
  // =======================================================================

  static Widget _productCard({
    required String productId,
    required String imageUrl,
    required String productName,
    required String price,
    required String location,
    required String category,
    required String brand,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 14,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: _buildProductImage(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),

                const SizedBox(height: 6),

                if (brand.isNotEmpty || category.isNotEmpty)
                  Text(
                    [brand, category]
                        .where((s) => s.isNotEmpty)
                        .join(' • '),
                    style: const TextStyle(
                      fontSize: 13,
                      color: greyText,
                    ),
                  ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.currency_rupee,
                      size: 18,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: darkText,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: darkText,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Available',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/details',
                              arguments: {'id': productId});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(
                              20, 0, 20, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'View Details',
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

  // =======================================================================
  // IMAGE BUILDER (supports base64, network, and asset)
  // =======================================================================

  static Widget _buildProductImage(String image) {
    if (image.startsWith('data:image')) {
      final String base64Data = image.split(',').last;
      return Image.memory(
        base64Decode(base64Data),
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    } else if (image.startsWith('http')) {
      return Image.network(
        image,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        image.isNotEmpty ? image : 'assets/images/car.png',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    }
  }
}
