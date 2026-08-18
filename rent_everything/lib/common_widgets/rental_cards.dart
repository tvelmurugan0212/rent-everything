import 'package:flutter/material.dart';

class RentalCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String reviews;
  final String location;
  final String distance;
  final String price;
  final String availability;

  final VoidCallback? onRentNow;
  final VoidCallback? onFavorite;
  final VoidCallback? onpress;

  final bool isFavorite;

  const RentalCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.distance,
    required this.price,
    required this.availability,
    this.onRentNow,
    this.onFavorite,
    this.onpress,
    this.isFavorite = true,
  });

  static const Color primaryColor = Color(0xFF0674A1);
  static const Color darkText = Color(0xFF202938);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================================
            // IMAGE
            // ============================================================
            SizedBox(
              width: double.infinity,
              height: 155,
              child: Image.asset(image, scale: 0.4),
            ),

            // ============================================================
            // DETAILS
            // ============================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 17, 5, 13),
              child: Column(
                children: [
                  // ======================================================
                  // TITLE + FAVORITE
                  // ======================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: darkText,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: GestureDetector(
                          onTap: onFavorite,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red.shade500
                                : Colors.grey,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 11),

                  // ======================================================
                  // RATING
                  // ======================================================
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFD000),
                        size: 19,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        '$rating ($reviews reviews)',
                        style: const TextStyle(fontSize: 14, color: darkText),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ======================================================
                  // LOCATION
                  // ======================================================
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 19,
                        color: Colors.black,
                      ),

                      const SizedBox(width: 7),

                      Text(
                        '$location • $distance',
                        style: const TextStyle(fontSize: 14, color: darkText),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ======================================================
                  // PRICE
                  // ======================================================
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 18,
                        color: Colors.black,
                      ),

                      const SizedBox(width: 7),

                      Expanded(
                        child: Text(
                          price,
                          style: const TextStyle(fontSize: 14, color: darkText),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  // ======================================================
                  // AVAILABILITY + RENT NOW
                  // ======================================================
                  Row(
                    children: [
                      const Icon(Icons.done, size: 19, color: Colors.black),

                      const SizedBox(width: 7),

                      Expanded(
                        child: Text(
                          availability,
                          style: const TextStyle(fontSize: 14, color: darkText),
                        ),
                      ),

                      SizedBox(
                        width: 151,
                        height: 41,
                        child: ElevatedButton(
                          onPressed: onRentNow,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Rent Now',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
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
}
