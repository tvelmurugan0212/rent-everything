import 'package:flutter/material.dart';

class ReviewMobile extends StatelessWidget {
  const ReviewMobile({super.key});

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
        centerTitle: true,
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: darkText,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '4.8 (124 reviews)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Based on 124 Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  ReviewItemCard(
                    name: 'Rajesh Kumar',
                    rating: 5,
                    comment:
                        'Excellent rental experience! The bike was clean and well maintained. Will definitely rent again.',
                    date: '2 days ago',
                    image: 'assets/images/avatar1.png',
                  ),
                  SizedBox(height: 12),
                  ReviewItemCard(
                    name: 'Priya Sharma',
                    rating: 4,
                    comment:
                        'Great service. The camera was in perfect condition. Delivery was on time.',
                    date: '5 days ago',
                    image: 'assets/images/avatar2.png',
                  ),
                  SizedBox(height: 12),
                  ReviewItemCard(
                    name: 'Amit Patel',
                    rating: 5,
                    comment:
                        'Outstanding experience from start to finish. Highly recommended for all renters.',
                    date: '1 week ago',
                    image: 'assets/images/avatar3.png',
                  ),
                  SizedBox(height: 12),
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
          ],
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFE0F2FE),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    color: Color(0xFF0674A1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF202938),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(
                          rating,
                          (index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFC107),
                            size: 14,
                          ),
                        ),
                        ...List.generate(
                          5 - rating,
                          (index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFE0E0E0),
                            size: 14,
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
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            comment,
            style: const TextStyle(
              color: Color(0xFF5F5F5F),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
