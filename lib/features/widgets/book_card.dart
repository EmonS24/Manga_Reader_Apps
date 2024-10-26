import 'package:flutter/material.dart';
import 'package:manga/core/constant/app_constants.dart';

class BookCard extends StatelessWidget {
  final String title;
  final int chapter;
  final VoidCallback onTap; // Callback untuk onTap

  const BookCard({
    Key? key,
    required this.title,
    required this.chapter,
    required this.onTap, // Tambahkan parameter onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Gunakan GestureDetector untuk mendeteksi klik
      onTap: onTap, // Panggil onTap saat card di-klik
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder untuk book cover dengan ukuran 697 x 1000 piksel
            Container(
              height: 250, // Tinggi placeholder, disesuaikan dengan aspek rasio 697 x 1000
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://via.placeholder.com/697x1000', // Ganti dengan URL gambar buku yang sesuai
                  fit: BoxFit.cover, // Mengisi seluruh area gambar
                ),
              ),
            ),
            SizedBox(height: 8), // Mengurangi jarak antara gambar dan teks
            // Book title
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis, // Menghindari overflow pada judul
            ),
            SizedBox(height: 4), // Mengurangi jarak
            // Chapter information
            Text(
              'Chapter $chapter',
              style: TextStyle(
                color: AppColors.subTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
