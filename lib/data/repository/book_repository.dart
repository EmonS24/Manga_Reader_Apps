import 'package:manga/data/models/manga.dart';
import 'package:manga/core/constant/images.dart';

class BookRepository {
  // Data manga terakhir yang dibaca (dummy data)
  Manga fetchLastReadManga() {
    return Manga(title: "Solo Leveling", coverImage: AppImages.soloLevelingCover, chapter: 78);
  }

  List<Manga> fetchBookmarkedManga() {
    return [
      Manga(title: 'Solo Leveling', coverImage: AppImages.soloLevelingCover, chapter: 32),
      Manga(title: 'Attack on Titan', coverImage: AppImages.attackOnTitanCover, chapter: 139),
    ];
  }

  // Data dummy untuk semua buku yang update
  List<Manga> fetchBooks() {
    return [
      Manga(title: 'One Piece', coverImage: AppImages.onePieceCover, chapter: 1000),
      Manga(title: 'Naruto', coverImage: AppImages.narutoCover, chapter: 700),
      Manga(title: 'My Hero Academia', coverImage: AppImages.myHeroAcademiaCover, chapter: 290),
    ];
  }
}
