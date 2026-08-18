import 'package:flutter/material.dart';

class WishlistTablet extends StatelessWidget {
  const WishlistTablet({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF5F5F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Wishlist',
          style: TextStyle(
            color: darkText,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 700,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: const [
                WishlistItemCard(
                  title: 'Royal Enfield Classic 350',
                  subtitle: '₹1,200/day',
                  image: 'assets/images/car.png',
                  tag: 'Hot Deal',
                ),
                SizedBox(height: 14),
                WishlistItemCard(
                  title: 'Canon EOS R50',
                  subtitle: '₹1,800/day',
                  image: 'assets/images/camera.png',
                  tag: 'Popular',
                ),
                SizedBox(height: 14),
                WishlistItemCard(
                  title: 'Roadster Bike',
                  subtitle: '₹950/day',
                  image: 'assets/images/bike.png',
                  tag: 'New',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WishlistItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String tag;

  const WishlistItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF6FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2FE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: Color(0xFF0674A1),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF202938),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Color(0xFF0674A1),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
