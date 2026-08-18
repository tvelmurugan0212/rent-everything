// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF000000);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: 14, color: darkText),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF85858A),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Color(0xFF85858A),
                      ),
                      suffixIcon: Icon(
                        Icons.mic_none,
                        size: 20,
                        color: Color(0xFF85858A),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
              ),

              // =========================================================
              // FIRST PRODUCT
              // =========================================================
              const SizedBox(height: 33),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _productCard(
                  image: 'assets/images/car.png',
                  productName: 'Toyota Innova Crysta',
                  price: '2,500/day',
                  location: 'Vellore • 2 km',
                  status: 'Rented',
                ),
              ),

              // =========================================================
              // SECOND PRODUCT
              // =========================================================
              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _productCard(
                  image: 'assets/images/car.png',
                  productName: 'Ferrari',
                  price: '8,500/day',
                  location: 'Vellore • 5 km',
                  status: 'Rented',
                ),
              ),

              // =========================================================
              // THIRD PRODUCT
              // =========================================================
              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _productCard(
                  image: 'assets/images/car.png',
                  productName: 'Toyota Innova Crysta',
                  price: '2,500/day',
                  location: 'Vellore • 2 km',
                  status: 'Available',
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // =======================================================================
  // PRODUCT CARD
  // =======================================================================

  static Widget _productCard({
    required String image,
    required String productName,
    required String price,
    required String location,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
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
            child: Image.asset(image, fit: BoxFit.cover),
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

                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
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

                // ---------------------------------------------------------
                // LOCATION
                // ---------------------------------------------------------
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

                // ---------------------------------------------------------
                // STATUS
                // ---------------------------------------------------------
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Status: $status',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: darkText,
                        ),
                      ),
                    ),
                    SizedBox(
                      // width: 320,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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

                // ---------------------------------------------------------
                // VIEW DETAILS
                // ---------------------------------------------------------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
