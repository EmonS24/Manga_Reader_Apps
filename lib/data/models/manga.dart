class Manga {
  final String title;
  final String coverImage;
  final int chapter;
  final String author;
  final String description;
  final List<int> chapters;
  bool isBookmarked; // Add this property
  final String genre; // Genre property

  Manga({
    required this.title,
    required this.coverImage,
    required this.chapter,
    required this.author,
    required this.description,
    required this.chapters,
    required this.genre,
    this.isBookmarked = false, // Default value is false
  });
}
