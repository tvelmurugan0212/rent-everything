import 'package:flutter/material.dart';
import '../common_widgets/rental_cards.dart';

class WishlistMobile extends StatelessWidget {
  const WishlistMobile({super.key});

  static const Color darkText = Color(0xFF202938);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================================================
              // HEADER
              // =========================================================
              SizedBox(
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
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

              // =========================================================
              // FIRST RENTAL
              // =========================================================
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: RentalCard(
                  image: 'assets/images/car.png',
                  title: 'Toyota Innova Crysta',
                  rating: '4.8',
                  reviews: '124',
                  location: 'Vellore',
                  distance: '2 km',
                  price: '2,500/day',
                  availability: 'Available Today',
                  isFavorite: true,
                  onFavorite: () {
                    // Remove from wishlist
                  },
                  onRentNow: () {
                    // Navigate to rental
                  },
                ),
              ),

              // =========================================================
              // SECOND RENTAL
              // =========================================================
              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: RentalCard(
                  image: 'assets/images/car.png',
                  title: 'Ferrari',
                  rating: '4.8',
                  reviews: '124',
                  location: 'Vellore',
                  distance: '2 km',
                  price: '2,500/day',
                  availability: 'Available Today',
                  isFavorite: true,
                  onFavorite: () {
                    // Remove from wishlist
                  },
                  onRentNow: () {
                    // Navigate to rental
                  },
                ),
              ),

              // =========================================================
              // THIRD RENTAL
              // =========================================================
              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: RentalCard(
                  image: 'assets/images/car.png',
                  title: 'Toyota Innova Crysta',
                  rating: '4.8',
                  reviews: '124',
                  location: 'Vellore',
                  distance: '2 km',
                  price: '2,500/day',
                  availability: 'Available Today',
                  isFavorite: true,
                  onFavorite: () {
                    // Remove from wishlist
                  },
                  onRentNow: () {
                    // Navigate to rental
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
