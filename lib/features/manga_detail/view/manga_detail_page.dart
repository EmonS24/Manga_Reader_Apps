// lib/features/manga_detail/view/manga_detail_page.dart
import 'package:flutter/material.dart';
import 'package:manga/data/models/manga.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:provider/provider.dart';
import 'package:manga/features/main/view_model/home_viewmodel.dart';

class MangaDetailPage extends StatelessWidget {
  final Manga manga;
  final int initialChapterIndex;

  const MangaDetailPage({
    Key? key,
    required this.manga,
    required this.initialChapterIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          manga.title,
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manga Cover Image
            Center(
              child: Image.asset(
                manga.coverImage,
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Manga Title
            Text(
              manga.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 10),

            // Manga Description
            Text(
              manga.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.subTextColor,
              ),
            ),
            const SizedBox(height: 20),

            // Chapters List Header
            Text(
              'Chapters',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 10),

            // Chapters List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: manga.chapters.length,
              itemBuilder: (context, index) {
                final int chapter = manga.chapters[index];
                return ListTile(
                  title: Text(
                    'Chapter ${index + 1}: $chapter',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                  onTap: () {
                    // Show chapter preview page on tap
                    showDialog(
                      context: context,
                      builder: (context) => ChapterPreviewDialog(
                        manga: manga,
                        chapterIndex: index,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Chapter Preview Dialog
class ChapterPreviewDialog extends StatelessWidget {
  final Manga manga;
  final int chapterIndex;

  const ChapterPreviewDialog({
    Key? key,
    required this.manga,
    required this.chapterIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String chapterTitle = 'Chapter ${chapterIndex + 1}: ${manga.chapters[chapterIndex]}';

    return Dialog(
      backgroundColor: AppColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter Image (placeholder)
            Center(
              child: Image.asset(
                manga.coverImage, // Replace with your chapter image path
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Chapter Title
            Text(
              chapterTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 10),

            // Chapter Summary (placeholder text)
            Text(
              'This is a brief summary or preview of the chapter content. It gives readers an idea of what to expect in this chapter.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.subTextColor,
              ),
            ),
            const SizedBox(height: 20),

            // Read Now Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
                  homeViewModel.updateLastReadManga(manga); // Update last read manga

                  Navigator.pop(context); // Close dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterDetailPage(
                        chapterTitle: chapterTitle,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                ),
                child: Text(
                  'READ NOW',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for ChapterDetailPage
class ChapterDetailPage extends StatelessWidget {
  final String chapterTitle;

  const ChapterDetailPage({Key? key, required this.chapterTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterTitle,
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Center(
        child: Text(
          'Content of $chapterTitle',
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
    );
  }
}
