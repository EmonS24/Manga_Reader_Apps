// lib/data/models/manga.dart
class Manga {
  final String title;
  final String coverImage; // URL atau path gambar
  final int chapter;

  Manga({required this.title, required this.coverImage, required this.chapter});
}
