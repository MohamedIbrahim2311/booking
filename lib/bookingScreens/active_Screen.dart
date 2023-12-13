import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ActiveScreen extends StatelessWidget {
  final String title;
  final String description;
  final String rating;
  final String thumbnailUrl;
  final String date;
  final double price; // Updated to camelCase

  const ActiveScreen({super.key, 
    required this.title,
    required this.description,
    required this.rating,
    required this.thumbnailUrl,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(
              thumbnailUrl: thumbnailUrl,
              title: title,
              description: description,
              date: date,
              price: price,
            ),
            _buildSection(
              thumbnailUrl: thumbnailUrl,
              title: title,
              description: description,
              date: date,
              price: price,
            ),
            _buildAuctionsSection(),
            // Add the Cancelled Row
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Cancelled",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 5,), // Add some space between sections
            _buildSection(
              thumbnailUrl: thumbnailUrl,
              title: title,
              description: description,
              date: date,
              price: price,
            ),
            _buildSection(
              thumbnailUrl: thumbnailUrl,
              title: title,
              description: description,
              date: date,
              price: price,
            ),
            const SizedBox(height: 30), // Add some space between sections
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String thumbnailUrl,
    required String title,
    required String description,
    required String date,
    required double price,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 144,
            height: 127.17,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Handle rating update if needed
                  },
                  itemSize: 20,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Price: \$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 40),
                Container(
                  width: 195,
                  height: 19,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuctionsSection() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Auctions',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          height: 0,
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
