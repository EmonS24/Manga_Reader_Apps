// lib/data/repository/book_repository.dart
import 'package:manga/data/models/manga.dart';
import 'package:manga/core/constant/images.dart';

class BookRepository {
  // Dummy data for last read manga
  Manga fetchLastReadManga() {
    return Manga(
      title: "Solo Leveling",
      coverImage: AppImages.soloLevelingCover,
      chapter: 3,
      author: 'Emon Lejen',
      description: "A story of a lone hunter who levels up and becomes stronger.",
      chapters: [1, 2, 3], // Example chapters
      isBookmarked: false, // Default to not bookmarked
      genre: "Action",
    );
  }

  // List to hold bookmarked manga
  final List<Manga> _bookmarkedManga = [];

  // Fetch current bookmarks
  List<Manga> fetchBookmarkedManga() {
    return _bookmarkedManga; // Return the list of bookmarked manga
  }

  // Add a manga to bookmarks
  void addBookmark(Manga manga) {
    if (!_bookmarkedManga.contains(manga)) {
      _bookmarkedManga.add(manga); // Add manga to the bookmarks list
      manga.isBookmarked = true; // Update the manga's bookmark status
    }
  }

  // Remove a manga from bookmarks
  void removeBookmark(Manga manga) {
    if (_bookmarkedManga.contains(manga)) {
      _bookmarkedManga.remove(manga); // Remove manga from bookmarks
      manga.isBookmarked = false; // Update the manga's bookmark status
    }
  }

  // Dummy data for all manga
  List<Manga> getAllManga() {
    return [
      Manga(
        title: '3-gatsu no Lion',
        coverImage: AppImages.sanGatsuCover,
        chapter: 7,
        author: 'Emon Lejen',
        description: "A young shogi player's journey through loneliness, self-discovery, and unexpected friendships.",
        chapters: [1, 2, 3, 4, 5, 6, 7],
        isBookmarked: false, // Default to not bookmarked
        genre: "Slice of Life",
      ),
      Manga(
        title: 'Ace of Diamond',
        coverImage: AppImages.diaAceCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A passionate pitcher strives to lead his high school baseball team to the national championship.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Sport",
      ),
      Manga(
        title: 'Ao ashi',
        coverImage: AppImages.aoAshiCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A determined young soccer player chases his dream to reach the professional leagues.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Sport",
      ),
      Manga(
        title: 'Ao no hako',
        coverImage: AppImages.aoHakoCover,
        chapter: 3,
        author: 'Emon Lejen',
        description:  "A story of young love and ambition between two athletes under one roof.",
        chapters: [1, 2, 3],
        isBookmarked: false, // Default to not bookmarked
        genre: "Romance",
      ),
      Manga(
        title: 'Attack on Titan',
        coverImage: AppImages.attackOnTitanCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "Humanity's fight for survival against Titans.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Action",
      ),
      Manga(
        title: 'Bakuman',
        coverImage: AppImages.bakumanCover,
        chapter: 5,
        author: 'Emon Lejen',
        description: "Two aspiring manga artists chase their dreams to make it big in the competitive world of publishing.",
        chapters: [1, 2, 3, 4, 5],
        isBookmarked: false, // Default to not bookmarked
        genre: "Slice of Life",
      ),
      Manga(
        title: 'Bocchi the rock',
        coverImage: AppImages.bocchiCover,
        chapter: 10,
        author: 'Emon Lejen',
        description: "A shy girl's journey to overcome her anxieties and rock the stage with her band.",
        chapters: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        isBookmarked: false, // Default to not bookmarked
        genre: "Slice of Life",
      ),
      Manga(
        title: 'BokuYaba',
        coverImage: AppImages.bokuYabaCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A quirky romance blossoms between a reclusive boy and his eccentric, popular classmate.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Romance",
      ),
      Manga(
        title: 'Boku no hero',
        coverImage: AppImages.myHeroAcademiaCover,
        chapter: 2,
        author: 'Emon Lejen',
        description: "A story of young heroes in training to protect the world.",
        chapters: [1, 2],
        isBookmarked: false, // Default to not bookmarked
        genre: "Action",
      ),
      Manga(
        title: 'Doraemon',
        coverImage: AppImages.doraemonCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A robotic cat from the future helps a young boy navigate life's challenges with futuristic gadgets.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Comedy",
      ),
      Manga(
        title: 'Dungeon meshi',
        coverImage: AppImages.dunMeshiCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "Adventurers delve into a dungeon, cooking monsters to survive and reclaim their lost treasure.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Fantasy",
      ),
      Manga(
        title: 'Eyeshield 21',
        coverImage: AppImages.eyeShieldCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A timid boy becomes a star player on a high school American football team while hiding his identity as a legendary running back.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Sport",
      ),
      Manga(
        title: 'Frieren',
        coverImage: AppImages.frierenCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "An elf mage reflects on her journey and the passage of time after the hero's party disbands.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Fantasy",
      ),
      Manga(
        title: 'Fumetsu',
        coverImage: AppImages.fumetsuCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "An immortal being explores the complexities of life and human emotions through its bond with a lonely boy.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Fantasy",
      ),
      Manga(
        title: 'Gintama',
        coverImage: AppImages.gintamaCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "In a world where samurai and aliens coexist, a laid-back freelancer navigates absurd adventures with his eccentric friends.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Comedy",
      ),
      Manga(
        title: 'Goblin Slayer',
        coverImage: AppImages.goblinSlayerCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A stoic warrior dedicates his life to eradicating goblins while forming a party of diverse adventurers.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Fantasy",
      ),
      Manga(
        title: 'Go-Toubun',
        coverImage: AppImages.gotobunCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A high school tutor must help five identical but vastly different sisters pass their exams.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Romance",
      ),
      Manga(
        title: 'Grand Blue',
        coverImage: AppImages.grandBlueCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A college freshman's dreams of an idyllic seaside life are upended by wild antics and diving club hijinks.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Comedy",
      ),
      Manga(
        title: 'Haikyuu',
        coverImage: AppImages.haikyuuCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A determined, undersized volleyball player aims to reach the top with his high school team.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Sport",
      ),
      Manga(
        title: 'Kaguya-sama',
        coverImage: AppImages.kaguyaCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "Two prideful student council members engage in a hilarious battle of wits to make the other confess love first.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Romance",
      ),
      Manga(
        title: 'Naruto',
        coverImage: AppImages.narutoCover,
        chapter: 3,
        author: 'Emon Lejen',
        description: "A ninja's journey to become the strongest in his village.",
        chapters: [1, 2, 3],
        isBookmarked: false, // Default to not bookmarked
        genre: "Action",
      ),
      Manga(
        title: 'Nisekoi',
        coverImage: AppImages.nisekoiCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A fake relationship between two high schoolers with rival family ties spirals into a complicated love triangle.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Romance",
      ),
      Manga(
        title: 'One Piece',
        coverImage: AppImages.onePieceCover,
        chapter: 3,
        author: 'Emon Lejen',
        description: "The journey of Monkey D. Luffy to find the One Piece treasure.",
        chapters: [1, 2, 3],
        isBookmarked: false, // Default to not bookmarked
        genre: "Action",
      ),
      Manga(
        title: 'Solo Leveling',
        coverImage: AppImages.soloLevelingCover,
        chapter: 3,
        author: 'Emon',
        description: "A story of a lone hunter who levels up and becomes stronger.",
        chapters: [1, 2, 3],
        isBookmarked: false, // Default to not bookmarked
        genre: "Action",
      ),
      Manga(
        title: 'Umaru',
        coverImage: AppImages.umaruCover,
        chapter: 4,
        author: 'Emon Lejen',
        description: "A perfect high school girl leads a secret double life as a lazy, snack-loving otaku at home.",
        chapters: [1, 2, 3, 4],
        isBookmarked: false, // Default to not bookmarked
        genre: "Slice of Life",
      ),
    ];
  }
}
