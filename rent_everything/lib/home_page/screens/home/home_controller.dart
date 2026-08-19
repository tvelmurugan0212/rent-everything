import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt bannerIndex = 0.obs;

  // ============================================================
  // PRODUCTS FROM FIRESTORE
  // ============================================================

  final RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredProducts =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoadingProducts = true.obs;
  final RxString searchQuery = ''.obs;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _productsSub;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void changeBanner(int index) {
    bannerIndex.value = index;
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    filterProducts();
  }

  void filterProducts() {
    final String query = searchQuery.value.toLowerCase().trim();

    if (query.isEmpty) {
      filteredProducts.value = List.from(products);
      return;
    }

    filteredProducts.value = products.where((product) {
      final String name = (product['productName'] ?? '').toLowerCase();
      final String category = (product['category'] ?? '').toLowerCase();
      final String brand = (product['brand'] ?? '').toLowerCase();
      final String city = (product['pickupCity'] ?? '').toLowerCase();

      return name.contains(query) ||
          category.contains(query) ||
          brand.contains(query) ||
          city.contains(query);
    }).toList();
  }

  void fetchProducts() {
    _productsSub = FirebaseFirestore.instance
        .collection('products')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
      (snapshot) {
        products.value = snapshot.docs
            .map((doc) => {'id': doc.id, ...doc.data()})
            .toList();
        filterProducts();
        isLoadingProducts.value = false;
      },
      onError: (error) {
        isLoadingProducts.value = false;
      },
    );
  }

  Future<void> toggleWishlist(String productId, bool currentValue) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .update({'isWishlist': !currentValue});
  }

  static String getImageUrl(Map<String, dynamic> product) {
    final String imageUrl = product['imageUrl'] ?? '';
    return imageUrl;
  }

  static bool isNetworkImage(String image) {
    return image.startsWith('data:image') || image.startsWith('http');
  }

  static Widget buildImage(String image, {double? width, double? height, BoxFit? fit}) {
    if (image.startsWith('data:image')) {
      final String base64Data = image.split(',').last;
      return Image.memory(
        base64Decode(base64Data),
        width: width,
        height: height,
        fit: fit,
      );
    } else if (image.startsWith('http')) {
      return Image.network(
        image,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return Image.asset(
        image,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }

  @override
  void onClose() {
    _productsSub?.cancel();
    super.onClose();
  }
}
