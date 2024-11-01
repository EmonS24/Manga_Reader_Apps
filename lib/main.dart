// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/main/view/home_page.dart';
import 'features/bookmarks/view/bookmarks_page.dart';
import 'features/all_books/view/all_books_page.dart';
import 'features/user/view/user_profile_page.dart';
import 'core/constant/colors.dart';
import 'data/models/manga.dart';
import 'data/repository/book_repository.dart';
import 'features/main/view_model/home_viewmodel.dart';

void main() {
  runApp(MangaReaderApp());
}

class MangaReaderApp extends StatefulWidget {
  @override
  _MangaReaderAppState createState() => _MangaReaderAppState();
}

class _MangaReaderAppState extends State<MangaReaderApp> {
  int _selectedIndex = 0;

  final BookRepository bookRepository = BookRepository();

  late HomeViewModel homeViewModel;
  late List<Manga> _allManga;

  @override
  void initState() {
    super.initState();
    _allManga = bookRepository.getAllManga();
    homeViewModel = HomeViewModel(_allManga);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manga Reader',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.mainColor,
          colorScheme: ColorScheme.dark().copyWith(
            primary: AppColors.mainColor,
            secondary: AppColors.secondaryColor,
          ),
          fontFamily: 'GangOfThree',
        ),
        home: Scaffold(
          body: _buildPage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'All Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor: AppColors.subTextColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage(
          homeViewModel: homeViewModel,
          bookmarkedManga: homeViewModel.bookmarkedManga,
          allManga: _allManga,
        );
      case 1:
        return BookmarksPage(
          homeViewModel: homeViewModel,
          bookmarkedManga: homeViewModel.bookmarkedManga,
        );
      case 2:
        return AllBooksPage(allManga: _allManga);
      case 3:
        return UserProfilePage();
      default:
        return HomePage(
          homeViewModel: homeViewModel,
          bookmarkedManga: homeViewModel.bookmarkedManga,
          allManga: _allManga,
        );
    }
  }
}
