import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String coverImage; // Add coverImage parameter
  final int chapter;
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.coverImage, // Add this parameter
    required this.chapter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book cover
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  coverImage, // Use coverImage here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Book title
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            // Chapter information
            Text(
              'Chapter $chapter',
              style: TextStyle(
                color: AppColors.subTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
