import 'package:flutter/material.dart';
import 'features/main/view/home_page.dart';
import 'features/bookmarks/view/bookmarks_page.dart';
import 'features/all_books/view/all_books_page.dart';
import 'features/user/view/user_profile_page.dart'; // Impor halaman profil user
import 'core/constant/app_constants.dart';

void main() {
  runApp(MangaReaderApp());
}

class MangaReaderApp extends StatefulWidget {
  @override
  _MangaReaderAppState createState() => _MangaReaderAppState();
}

class _MangaReaderAppState extends State<MangaReaderApp> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [
    HomePage(),
    BookmarksPage(),
    AllBooksPage(),
    UserProfilePage(), // Tambahkan halaman profil user
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: _pages[_selectedIndex], // Tampilkan halaman yang sesuai
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
          selectedItemColor: AppColors.secondaryColor, // Warna saat dipilih
          unselectedItemColor: AppColors.subTextColor, // Warna saat tidak dipilih
          onTap: _onItemTapped, // Panggil fungsi saat item diklik
        ),
      ),
    );
  }
}
