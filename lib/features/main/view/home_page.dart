// lib/features/main/view/home_page.dart
import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:manga/features/main/view_model/home_viewmodel.dart';
import 'package:manga/features/bookmarks/view/bookmarks_page.dart';
import 'package:manga/features/all_books/view/all_books_page.dart';
import 'package:manga/features/widgets/book_card.dart';
import 'package:manga/data/models/manga.dart';
import 'package:manga/features/manga_detail/view/manga_detail_page.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final List<Manga> bookmarkedManga;
  final List<Manga> allManga;

  HomePage({
    Key? key,
    required this.homeViewModel,
    required this.bookmarkedManga,
    required this.allManga,
  }) : super(key: key);

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
              _buildContinueReadingSection(context),
              _buildForYouSection(context),
              _buildAllBooksSection(context),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildContinueReadingSection(BuildContext context) {
    final manga = homeViewModel.lastReadManga;

    if (manga == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(manga.coverImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

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
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          foregroundColor: AppColors.mainColor,
                        ),
                        onPressed: () {
                          // Navigate to ChapterDetailPage with current chapter info
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterDetailPage(
                                chapterTitle: 'Chapter ${manga.chapter}: ${manga.title}',
                              ),
                            ),
                          );
                        },
                        child: Text("Continue"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



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
                    MaterialPageRoute(
                      builder: (context) => BookmarksPage(
                        bookmarkedManga: bookmarkedManga,
                        homeViewModel: homeViewModel,
                      ),
                    ),
                  );
                },
                child: Text('See All', style: TextStyle(color: AppColors.secondaryColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookmarkedManga.length,
              itemBuilder: (context, index) {
                final manga = bookmarkedManga[index];
                return Container(
                  width: 200,
                  child: BookCard(
                    title: manga.title,
                    chapter: 'Chapter: ${manga.chapter}',
                    coverImage: manga.coverImage,
                    isBookmarked: manga.isBookmarked,
                    onBookmarkToggle: () {
                      homeViewModel.toggleBookmark(manga);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MangaDetailPage(
                            manga: manga,
                            initialChapterIndex: manga.chapter - 1, // Pass initialChapterIndex
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
                    MaterialPageRoute(
                      builder: (context) => AllBooksPage(allManga: allManga),
                    ),
                  );
                },
                child: Text('See All', style: TextStyle(color: AppColors.secondaryColor)),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allManga.length,
              itemBuilder: (context, index) {
                final manga = allManga[index];
                return Container(
                  width: 200,
                  child: BookCard(
                    title: manga.title,
                    chapter: 'Chapter: ${manga.chapter}',
                    coverImage: manga.coverImage,
                    isBookmarked: manga.isBookmarked,
                    onBookmarkToggle: () {
                      homeViewModel.toggleBookmark(manga);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MangaDetailPage(
                            manga: manga,
                            initialChapterIndex: manga.chapter - 1, // Pass initialChapterIndex
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
