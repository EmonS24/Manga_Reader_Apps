// lib/features/main/view_model/home_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:manga/data/models/manga.dart';

class HomeViewModel with ChangeNotifier {
  final List<Manga> _allManga;
  List<Manga> _bookmarkedManga = [];
  Manga? _lastReadManga;


  Manga? get lastReadManga => _lastReadManga; // Ensure this is correctly defined

  HomeViewModel(this._allManga) {
    // Initialize _lastReadManga with the first manga or a default if available
    if (_allManga.isNotEmpty) {
      _lastReadManga = _allManga.first;
    }
  }

  List<Manga> get allManga => _allManga;
  List<Manga> get bookmarkedManga => _bookmarkedManga;

  // Getter to return the last read manga
  Manga getLastReadManga() {
    return _lastReadManga ?? _allManga.first; // Return the last read manga or the first one if none
  }

  void toggleBookmark(Manga manga) {
    if (_bookmarkedManga.contains(manga)) {
      _bookmarkedManga.remove(manga);
    } else {
      _bookmarkedManga.add(manga);
    }
    manga.isBookmarked = !manga.isBookmarked;
    notifyListeners();
  }

  void updateLastReadManga(Manga manga) {
    _lastReadManga = manga;
    notifyListeners();
  }
}
