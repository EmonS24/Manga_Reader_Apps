import 'package:flutter/material.dart';
import 'package:manga/core/constant/app_constants.dart';
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
      // Tambahkan SingleChildScrollView untuk scroll vertikal
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
        fillColor: Colors.grey[850],
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('now', style: TextStyle(color: AppColors.textColor, fontSize: 18)),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Solo Leveling', style: TextStyle(color: AppColors.textColor, fontSize: 24)),
                SizedBox(height: 10),
                Text('Chapter : 5', style: TextStyle(color: AppColors.subTextColor)),
              ],
            ),
          ),
        ],
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
            height: 300, // Lebar area scroll untuk card
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeViewModel.getBookmarkedManga().length,
              itemBuilder: (context, index) {
                final manga = homeViewModel.getBookmarkedManga()[index];
                return BookCard(
                  title: manga.title,
                  chapter: manga.chapter,
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
            height: 300, // Lebar area scroll untuk card
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeViewModel.getAllBooks().length,
              itemBuilder: (context, index) {
                final manga = homeViewModel.getAllBooks()[index];
                return BookCard(
                  title: manga.title,
                  chapter: manga.chapter,
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
