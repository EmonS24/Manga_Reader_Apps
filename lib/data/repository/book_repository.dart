// lib/data/repository/book_repository.dart
import '../models/manga.dart';

class BookRepository {
  // Data manga terakhir yang dibaca (dummy data)
  Manga fetchLastReadManga() {
    return Manga(title: "Solo Leveling",coverImage: 'assets/images/cover/solev.jpg', chapter: 78);
  }

  List<Manga> fetchBookmarkedManga() {
    return [
      Manga(title: 'Solo Leveling', coverImage: 'assets/images/cover/solev.jpg', chapter: 32),
      Manga(title: 'Attack on Titan', coverImage: 'assets/images/cover/aot.jpeg', chapter: 139),
    ];
  }

  // Data dummy untuk semua buku yang update
  List<Manga> fetchBooks() {
    return [
      Manga(title: 'One Piece', coverImage: 'assets/images/cover/wanpis.jpg', chapter: 1000),
      Manga(title: 'Naruto', coverImage: 'assets/images/cover/naruto.jpg', chapter: 700),
      Manga(title: 'My Hero Academia', coverImage: 'assets/images/cover/bnh.jpg', chapter: 290),
    ];
  }
}
