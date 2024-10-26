import 'package:flutter/material.dart';
import 'package:manga/data/models/manga.dart'; // Pastikan untuk mengimpor model Manga.

class MangaDetailPage extends StatelessWidget {
  final Manga manga;

  MangaDetailPage({required this.manga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(manga.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(manga.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Chapter: ${manga.chapter}'),
            // Tambahkan lebih banyak detail tentang manga di sini.
          ],
        ),
      ),
    );
  }
}
