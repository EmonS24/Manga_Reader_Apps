import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart'; // Ensure you have this import for your color definitions

class BookCard extends StatefulWidget {
  final String title;
  final String chapter;
  final String coverImage;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.chapter,
    required this.coverImage,
    required this.isBookmarked,
    required this.onBookmarkToggle,
    required this.onTap,
  }) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.isBookmarked; // Initialize the local state
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: AppColors.mainColor, // Use your main color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Adjusting the height of the cover image
            Container(
              height: 200, // Increased height for the image
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(widget.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: AppColors.textColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.chapter,
                        style: TextStyle(color: AppColors.subTextColor, fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: AppColors.secondaryColor, // Use your secondary color for the icon
                    ),
                    onPressed: () {
                      setState(() {
                        _isBookmarked = !_isBookmarked; // Toggle the bookmark state
                      });
                      widget.onBookmarkToggle(); // Call the function to toggle the bookmark in the view model
                    },
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
