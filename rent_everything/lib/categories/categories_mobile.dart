// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CategoriesMobile extends StatelessWidget {
  const CategoriesMobile({super.key});

  static const Color darkText = Color(0xFF202938);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 52,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Categories',
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 18, bottom: 20),
                children: [
                  _categorySection(
                    title: 'Vehicles',
                    items: const [
                      CategoryData(
                        image: 'assets/images/bike.png',
                        title: 'Bike',
                      ),
                      CategoryData(
                        image: 'assets/images/car.png',
                        title: 'Car',
                      ),
                      CategoryData(
                        image: 'assets/images/cycle.png',
                        title: 'Bicycle',
                      ),
                      CategoryData(
                        image: 'assets/images/car.png',
                        title: 'SUV',
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _categorySection(
                    title: 'Electronics & Gadgets',
                    items: const [
                      CategoryData(
                        image: 'assets/images/laptop.png',
                        title: 'Laptop',
                      ),
                      CategoryData(
                        image: 'assets/images/alarms.png',
                        title: 'Alarms',
                      ),
                      CategoryData(
                        image: 'assets/images/camera.png',
                        title: 'Camera',
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _categorySection(
                    title: 'Home Appliances',
                    items: const [
                      CategoryData(
                        image: 'assets/images/fridge.png',
                        title: 'Refrigerator',
                      ),
                      CategoryData(
                        image: 'assets/images/machine.png',
                        title: 'Washing Machine',
                      ),
                      CategoryData(
                        image: 'assets/images/coffemaker.png',
                        title: 'Coffeemaker',
                      ),
                      CategoryData(
                        image: 'assets/images/alarms.png',
                        title: 'Alarms',
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _categorySection(
                    title: 'Sports Equipment',
                    items: const [
                      CategoryData(
                        image: 'assets/images/bike.png',
                        title: 'Bike',
                      ),
                      CategoryData(
                        image: 'assets/images/car.png',
                        title: 'Car',
                      ),
                      CategoryData(
                        image: 'assets/images/bike.png',
                        title: 'Cycle',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _categorySection({
    required String title,
    required List<CategoryData> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'See all',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return CategoryCard(
                image: items[index].image,
                title: items[index].title,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryData {
  final String image;
  final String title;

  const CategoryData({required this.image, required this.title});
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;

  const CategoryCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 9,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF0ECE6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(image),
            ),
          ),
          // const SizedBox(height: 7),
          Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
