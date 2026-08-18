import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final RxList<Map<String, dynamic>> allProducts =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredProducts =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    FirebaseFirestore.instance
        .collection('products')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
      (snapshot) {
        allProducts.value = snapshot.docs
            .map((doc) => {'id': doc.id, ...doc.data()})
            .toList();
        filterProducts();
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    filterProducts();
  }

  void filterProducts() {
    final String query = searchQuery.value.toLowerCase().trim();

    if (query.isEmpty) {
      filteredProducts.value = List.from(allProducts);
      return;
    }

    filteredProducts.value = allProducts.where((product) {
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

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
