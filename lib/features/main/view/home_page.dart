import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:manga/features/main/view_model/home_viewmodel.dart';
import 'package:manga/features/bookmarks/view/bookmarks_page.dart';
import 'package:manga/features/all_books/view/all_books_page.dart';
import 'package:manga/features/widgets/book_card.dart';
import 'package:manga/data/models/manga.dart';
import 'package:manga/features/manga_detail/view/manga_detail_page.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: _buildSearchBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContinueReadingSection(),
              _buildForYouSection(context),
              _buildAllBooksSection(context),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk Search Bar
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Manga...',
        hintStyle: TextStyle(color: AppColors.subTextColor),
        prefixIcon: Icon(Icons.search, color: AppColors.subTextColor),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: AppColors.textColor),
    );
  }

  // Widget untuk Continue Reading Section
  Widget _buildContinueReadingSection() {
    // Fetch the last read manga from the repository
    final manga = homeViewModel.getLastReadManga(); // Ensure you have this method in your HomeViewModel

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // Cover Image
            Container(
              width: 100, // Set your desired width
              height: 150, // Set your desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(manga.coverImage), // Use coverImage from the manga model
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), // Space between image and text
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Continue Reading',
                    style: TextStyle(color: AppColors.textColor, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    manga.title,
                    style: TextStyle(color: AppColors.textColor, fontSize: 24),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Chapter: ${manga.chapter}',
                    style: TextStyle(color: AppColors.subTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk For You Section
  Widget _buildForYouSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For You', style: TextStyle(color: AppColors.textColor, fontSize: 18)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookmarksPage()),
                  );
                },
                child: Text('See All', style: TextStyle(color: AppColors.secondaryColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300, // Width area scroll for card
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeViewModel.getBookmarkedManga().length,
              itemBuilder: (context, index) {
                final manga = homeViewModel.getBookmarkedManga()[index];
                return BookCard(
                  title: manga.title,
                  chapter: manga.chapter,
                  coverImage: manga.coverImage, // Pass coverImage to BookCard
                  onTap: () {
                    _openMangaDetail(context, manga);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk All Books Section
  Widget _buildAllBooksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('All Books', style: TextStyle(color: AppColors.textColor, fontSize: 18)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllBooksPage()),
                  );
                },
                child: Text('See All', style: TextStyle(color: AppColors.secondaryColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300, // Width area scroll for card
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeViewModel.getAllBooks().length,
              itemBuilder: (context, index) {
                final manga = homeViewModel.getAllBooks()[index];
                return BookCard(
                  title: manga.title,
                  chapter: manga.chapter,
                  coverImage: manga.coverImage, // Pass coverImage to BookCard
                  onTap: () {
                    _openMangaDetail(context, manga);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuka halaman detail manga
  void _openMangaDetail(BuildContext context, Manga manga) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MangaDetailPage(manga: manga)),
    );
  }
}
