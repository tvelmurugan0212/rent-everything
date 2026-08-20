import 'package:flutter/material.dart';

import '../common_widgets/desktop_drawer.dart';

class CategoriesDesktop extends StatelessWidget {
  const CategoriesDesktop({super.key});

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);
  static const Color greyText = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      pageTitle: 'Categories',
      child: Container(
        color: const Color(0xFFF8FAFC),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(52, 44, 45, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================
              // HEADER
              // ============================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Manage product categories',
                          style: TextStyle(color: greyText, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // Create Categories
                  Row(
                    children: [
                      const Icon(Icons.add, color: primaryColor, size: 24),
                      const SizedBox(width: 14),
                      const Text(
                        'Create Categories',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 38),

              // ============================
              // STAT CARDS
              // ============================
              Row(
                children: const [
                  Expanded(
                    child: CategoryStatCard(
                      title: 'Total Categories',
                      value: '24',
                    ),
                  ),
                  SizedBox(width: 36),
                  Expanded(
                    child: CategoryStatCard(title: 'Active', value: '100'),
                  ),
                  SizedBox(width: 36),
                  Expanded(
                    child: CategoryStatCard(title: 'Inactive', value: '10'),
                  ),
                  SizedBox(width: 36),

                  // Empty space matching screenshot
                  Expanded(child: SizedBox()),
                ],
              ),

              const SizedBox(height: 42),

              // ============================
              // ALL CATEGORIES HEADER
              // ============================
              Row(
                children: [
                  const Text(
                    'All Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: const [
                      Text(
                        'View All',
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: primaryColor,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ============================
              // CATEGORY CARDS
              // ============================
              SizedBox(
                height: 154,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: 28),
                  itemBuilder: (context, index) {
                    final categories = [
                      const CategoryData(
                        icon: Icons.two_wheeler,
                        title: 'Bike',
                        count: '345 Products',
                      ),
                      const CategoryData(
                        icon: Icons.directions_car_outlined,
                        title: 'Cars',
                        count: '145 Products',
                      ),
                      const CategoryData(
                        icon: Icons.laptop_outlined,
                        title: 'Laptops',
                        count: '345 Products',
                      ),
                      const CategoryData(
                        icon: Icons.pedal_bike_outlined,
                        title: 'Bicycle',
                        count: '5 Products',
                      ),
                      const CategoryData(
                        icon: Icons.camera_alt_outlined,
                        title: 'Camera',
                        count: '345 Products',
                      ),
                      const CategoryData(
                        icon: Icons.home_outlined,
                        title: 'Furniture',
                        count: '120 Products',
                      ),
                    ];

                    return CategoryCard(data: categories[index]);
                  },
                ),
              ),

              const SizedBox(height: 42),

              // ============================
              // SEARCH
              // ============================
              Container(
                width: 380,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search by categories',
                    hintStyle: TextStyle(
                      color: Color(0xFFB5B5B5),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF8B8B8B),
                      size: 22,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // ============================
              // TABLE
              // ============================
              const CategoriesTable(),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class CategoryStatCard extends StatelessWidget {
  final String title;
  final String value;

  const CategoryStatCard({super.key, required this.title, required this.value});

  static const Color primaryColor = Color(0xFF0674A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY DATA
// ============================================================

class CategoryData {
  final IconData icon;
  final String title;
  final String count;

  const CategoryData({
    required this.icon,
    required this.title,
    required this.count,
  });
}

// ============================================================
// CATEGORY CARD
// ============================================================

class CategoryCard extends StatelessWidget {
  final CategoryData data;

  const CategoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 154,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data.icon, color: Colors.black, size: 22),

          const SizedBox(height: 14),

          Text(
            data.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            data.count,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TABLE
// ============================================================

class CategoriesTable extends StatelessWidget {
  const CategoriesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      padding: const EdgeInsets.fromLTRB(30, 22, 30, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          CategoryTableHeader(),

          Divider(height: 20, color: Color(0xFFD1D5DB)),

          CategoryTableRow(
            category: 'Cars',
            product: 'Innova',
            lender: 'John',
            amount: '₹2,500',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),

          CategoryTableRow(
            category: 'Cars',
            product: 'Ferrari',
            lender: 'Ravi',
            amount: '₹800',
            status: 'Inactive',
            statusColor: Color(0xFF6B7280),
          ),

          CategoryTableRow(
            category: 'Cars',
            product: 'Verna',
            lender: 'May',
            amount: '₹3,000',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),

          CategoryTableRow(
            category: 'Cars',
            product: 'Fortuner',
            lender: 'Jai',
            amount: '₹600',
            status: 'Active',
            statusColor: Color(0xFF8756F5),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TABLE HEADER
// ============================================================

class CategoryTableHeader extends StatelessWidget {
  const CategoryTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Product',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Lender',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Amount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// TABLE ROW
// ============================================================

class CategoryTableRow extends StatelessWidget {
  final String category;
  final String product;
  final String lender;
  final String amount;
  final String status;
  final Color statusColor;

  const CategoryTableRow({
    super.key,
    required this.category,
    required this.product,
    required this.lender,
    required this.amount,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD1D5DB))),
      ),
      child: Row(
        children: [
          Expanded(child: Text(category, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(product, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(lender, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(amount, style: const TextStyle(fontSize: 14))),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 14),
                Text(status, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
