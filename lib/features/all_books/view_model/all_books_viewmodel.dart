import 'package:flutter/foundation.dart';
import 'package:manga/data/models/manga.dart';

class AllBooksViewModel with ChangeNotifier {
  final List<Manga> _allManga; // Original list of all manga
  List<Manga> _bookmarkedManga = []; // List of bookmarked manga
  Manga? _lastReadManga; // Last read manga

  // Getter to retrieve the last read manga
  Manga? get lastReadManga => _lastReadManga;

  // Constructor initializes the last read manga
  AllBooksViewModel(this._allManga) {
    if (_allManga.isNotEmpty) {
      _lastReadManga = _allManga.first; // Set the first manga as the last read if available
    }
  }

  List<Manga> get allManga => _allManga; // Getter for all manga
  List<Manga> get bookmarkedManga => _bookmarkedManga; // Getter for bookmarked manga

  // Getter to return the last read manga
  Manga getLastReadManga() {
    return _lastReadManga ?? _allManga.first; // Return the last read manga or the first one if none
  }

  // Toggle bookmark state for a manga
  void toggleBookmark(Manga manga) {
    if (_bookmarkedManga.contains(manga)) {
      _bookmarkedManga.remove(manga); // Remove from bookmarks if already present
    } else {
      _bookmarkedManga.add(manga); // Add to bookmarks if not present
    }
    manga.isBookmarked = !manga.isBookmarked; // Toggle bookmark status in manga model
    notifyListeners(); // Notify listeners of state change
  }

  // Update the last read manga
  void updateLastReadManga(Manga manga) {
    _lastReadManga = manga; // Set the last read manga
    notifyListeners(); // Notify listeners of state change
  }

  // Method to get filtered manga based on the selected genre
  List<Manga> getFilteredManga(String selectedGenre) {
    // Assuming Manga has a genre property
    return _allManga.where((manga) => manga.genre == selectedGenre).toList(); // Filter manga by genre
  }
}
