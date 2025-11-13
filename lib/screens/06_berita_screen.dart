import 'package:flutter/material.dart';

class BeritaScreen extends StatelessWidget {
  BeritaScreen({super.key});

  // (Soal g) Data masih statis
  final List<Map<String, String>> daftarBerita = [
    {
      'title': 'OpenAI announces platform for making custom ChatGPTs',
      'snippet': 'OpenAI has announced a new platform for creating custom AI...',
      'source': 'The Verge',
      'image': 'assets/images/berita_1.jpg', // GANTI DENGAN NAMA GAMBARMU
    },
    {
      'title': 'The National Zoo\'s panda program is ending after more t...',
      'snippet': 'The three giant pandas tumble around in their enclosure at the...',
      'source': 'CNN',
      'image': 'assets/images/berita_2.jpg', // GANTI DENGAN NAMA GAMBARMU
    },
    {
      'title': 'Flutter 3.16 Rilis: Apa yang Baru?',
      'snippet': 'Flutter kembali merilis versi terbaru dengan berbagai peningkatan...',
      'source': 'Flutter Dev',
      'image': 'assets/images/berita_3.jpg', // GANTI DENGAN NAMA GAMBARMU
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita'),
      ),
      // (Soal g) Pola tampilan yang berulang, pakai ListView.builder
      body: ListView.builder(
        itemCount: daftarBerita.length,
        itemBuilder: (context, index) {
          final berita = daftarBerita[index];
          
          return Card(
            margin: const EdgeInsets.all(12.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAlias, // Biar gambar ikut melengkung
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian Gambar (Kiri)
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    berita['image']!,
                    height: 120, // Beri tinggi tetap
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12.0),

                // Bagian Teks (Kanan)
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          berita['title']!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          berita['snippet']!,
                          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          berita['source']!,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}