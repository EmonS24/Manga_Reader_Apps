import 'package:flutter/material.dart';
import 'package:manga/core/constant/app_constants.dart';
import 'package:manga/core/utils/helpers.dart';

class BookCard extends StatelessWidget {
  final String title;
  final int chapter;

  BookCard({required this.title, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            color: Colors.grey,
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: AppColors.textColor, fontSize: 16)),
          Text(Helpers.formatChapter(chapter), style: TextStyle(color: AppColors.subTextColor)),
        ],
      ),
    );
  }
}
