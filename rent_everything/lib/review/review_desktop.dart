import 'package:flutter/material.dart';

class ReviewDesktop extends StatelessWidget {
  const ReviewDesktop({super.key});

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
          'Reviews',
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
            width: 1000,
            child: ListView(
              padding: const EdgeInsets.all(28),
              children: const [
                ReviewItemCard(
                  name: 'Rajesh Kumar',
                  rating: 5,
                  comment:
                      'Excellent rental experience! The bike was clean and well maintained. Will definitely rent again.',
                  date: '2 days ago',
                  image: 'assets/images/avatar1.png',
                ),
                SizedBox(height: 16),
                ReviewItemCard(
                  name: 'Priya Sharma',
                  rating: 4,
                  comment:
                      'Great service. The camera was in perfect condition. Delivery was on time.',
                  date: '5 days ago',
                  image: 'assets/images/avatar2.png',
                ),
                SizedBox(height: 16),
                ReviewItemCard(
                  name: 'Amit Patel',
                  rating: 5,
                  comment:
                      'Outstanding experience from start to finish. Highly recommended for all renters.',
                  date: '1 week ago',
                  image: 'assets/images/avatar3.png',
                ),
                SizedBox(height: 16),
                ReviewItemCard(
                  name: 'Sneha Desai',
                  rating: 4,
                  comment:
                      'Good quality items and responsive owner. Minor issue with the return process.',
                  date: '2 weeks ago',
                  image: 'assets/images/avatar4.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewItemCard extends StatelessWidget {
  final String name;
  final int rating;
  final String comment;
  final String date;
  final String image;

  const ReviewItemCard({
    super.key,
    required this.name,
    required this.rating,
    required this.comment,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFFE0F2FE),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Color(0xFF0674A1),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF202938),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ...List.generate(
                          rating,
                          (index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFC107),
                            size: 18,
                          ),
                        ),
                        ...List.generate(
                          5 - rating,
                          (index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFE0E0E0),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            comment,
            style: const TextStyle(
              color: Color(0xFF5F5F5F),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
