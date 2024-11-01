import 'package:flutter/material.dart';
import 'package:manga/features/main/view_model/home_viewmodel.dart';
import 'package:manga/data/models/manga.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:manga/features/widgets/book_card.dart'; // Import BookCard
import 'package:manga/features/manga_detail/view/manga_detail_page.dart'; // Import MangaDetailPage

class BookmarksPage extends StatelessWidget {
  final HomeViewModel homeViewModel; // Add this line
  final List<Manga> bookmarkedManga;

  BookmarksPage({Key? key, required this.homeViewModel, required this.bookmarkedManga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOOKMARKS', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: bookmarkedManga.isEmpty // Check if bookmarkedManga is empty
            ? Center(
          child: Text(
            'No bookmarks found.',
            style: TextStyle(color: AppColors.subTextColor, fontSize: 18),
          ),
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            childAspectRatio: 0.70, // Adjust the aspect ratio as needed
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: bookmarkedManga.length,
          itemBuilder: (context, index) {
            final manga = bookmarkedManga[index];
            return Container(
              height: 300, // Specify the height here
              child: BookCard(
                title: manga.title,
                chapter: 'Chapter: ${manga.chapter}', // Assuming chapter is an int
                coverImage: manga.coverImage,
                isBookmarked: manga.isBookmarked,
                onBookmarkToggle: () {
                  homeViewModel.toggleBookmark(manga); // Toggle bookmark
                },
                onTap: () {
                  // Navigate to MangaDetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangaDetailPage(
                        manga: manga,
                        initialChapterIndex: manga.chapter - 1,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
