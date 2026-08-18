import 'package:flutter/material.dart';

class CategoriesDesktop extends StatelessWidget {
  const CategoriesDesktop({super.key});

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
          'Categories',
          style: TextStyle(
            color: darkText,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 1200,
            child: GridView.count(
              padding: const EdgeInsets.all(28),
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.0,
              children: const [
                CategoryItemCard(
                  icon: Icons.two_wheeler,
                  title: 'Bikes',
                  count: '42 items',
                ),
                CategoryItemCard(
                  icon: Icons.directions_car,
                  title: 'Cars',
                  count: '28 items',
                ),
                CategoryItemCard(
                  icon: Icons.camera_alt,
                  title: 'Cameras',
                  count: '35 items',
                ),
                CategoryItemCard(
                  icon: Icons.laptop,
                  title: 'Electronics',
                  count: '52 items',
                ),
                CategoryItemCard(
                  icon: Icons.home,
                  title: 'Furniture',
                  count: '18 items',
                ),
                CategoryItemCard(
                  icon: Icons.sports_baseball,
                  title: 'Sports',
                  count: '24 items',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;

  const CategoryItemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2FE),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(icon, color: const Color(0xFF0674A1), size: 36),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF202938),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: const TextStyle(
                  color: Color(0xFF5F5F5F),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
