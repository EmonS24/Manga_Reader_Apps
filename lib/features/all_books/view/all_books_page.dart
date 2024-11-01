import 'package:flutter/material.dart';
import 'package:manga/core/constant/colors.dart';
import 'package:manga/data/models/manga.dart';
import 'package:manga/features/all_books/view_model/all_books_viewmodel.dart';
import 'package:manga/features/manga_detail/view/manga_detail_page.dart'; // Import your MangaDetailPage

class AllBooksPage extends StatefulWidget {
  final List<Manga> allManga;
  static const List<String> genres = ['Action', 'Romance', 'Comedy', 'Fantasy', 'Sport', 'Slice of Life'];

  const AllBooksPage({Key? key, required this.allManga}) : super(key: key);

  @override
  _AllBooksPageState createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  late AllBooksViewModel allBooksViewModel;
  String selectedGenre = AllBooksPage.genres[0];

  @override
  void initState() {
    super.initState();
    allBooksViewModel = AllBooksViewModel(widget.allManga);
  }

  @override
  Widget build(BuildContext context) {
    List<Manga> filteredManga = allBooksViewModel.getFilteredManga(selectedGenre);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL BOOKS', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Genre Buttons
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AllBooksPage.genres.length,
                itemBuilder: (context, index) {
                  String genre = AllBooksPage.genres[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        genre,
                        style: TextStyle(
                          color: selectedGenre == genre ? Colors.black : Colors.white,
                        ),
                      ),
                      selected: selectedGenre == genre,
                      selectedColor: AppColors.secondaryColor,
                      backgroundColor: Colors.grey[900],
                      onSelected: (bool selected) {
                        setState(() {
                          selectedGenre = selected ? genre : selectedGenre;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Book Count and Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${filteredManga.length} books', style: TextStyle(color: Colors.white)),
                DropdownButton<String>(
                  dropdownColor: Colors.black,
                  value: 'Alphabetical',
                  items: ['Alphabetical', 'Newest', 'Popularity']
                      .map((String filter) => DropdownMenuItem(
                    value: filter,
                    child: Text(filter, style: TextStyle(color: Colors.white)),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle filter change
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Book Cards with specified layout and bookmark widget
            Expanded(
              child: ListView.builder(
                itemCount: filteredManga.length,
                itemBuilder: (context, index) {
                  final manga = filteredManga[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MangaDetailPage(
                              manga: manga,
                              initialChapterIndex: manga.chapter - 1,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cover Image
                            Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(manga.coverImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Title, Description, and Author
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    manga.title,
                                    style: TextStyle(color: AppColors.textColor, fontSize: 24),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    manga.author, // Display the author
                                    style: TextStyle(color: AppColors.subTextColor),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    manga.description, // Display the description
                                    style: TextStyle(color: AppColors.subTextColor),
                                    maxLines: 2, // Limit to two lines
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),

                            // Bookmark Icon
                            IconButton(
                              icon: Icon(
                                manga.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                color: AppColors.secondaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  allBooksViewModel.toggleBookmark(manga);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
