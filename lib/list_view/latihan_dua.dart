import 'package:flutter/material.dart';
import 'package:flutter_zaenal/list_view/latihan_dua_detail.dart';

class LatihanDua extends StatelessWidget {
  LatihanDua({super.key});

  final List<Map<String, dynamic>> animeData = [
    {
      "nama": "Guts",
      "anime": "Berserk",
      "image": "images/guts.jpg",
      "desc": "Tersakiti",
      "gender": "Laki-laki",
      "point": 95,
      "level": "S",
      "zodiac": "Scorpio",
    },
    {
      "nama": "Ikari Shinji",
      "anime": "Evangelion",
      "image": "images/ikari.jpg",
      "desc": "Stress",
      "gender": "Laki-laki",
      "point": 72,
      "level": "B",
      "zodiac": "Pisces",
    },
    {
      "nama": "Eren Yeager",
      "anime": "AOT",
      "image": "images/ren.jpg",
      "desc": "Bantai-bantai",
      "gender": "Laki-laki",
      "point": 88,
      "level": "A",
      "zodiac": "Aries",
    },
    {
      "nama": "Thorfinn",
      "anime": "Vindland Saga",
      "image": "images/thorfin.jpg",
      "desc": "Budak",
      "gender": "Laki-laki",
      "point": 90,
      "level": "A",
      "zodiac": "Taurus",
    },
    {
      "nama": "Kaneki Ken",
      "anime": "Tokyo Ghoul",
      "image": "images/ken.jpg",
      "desc": "Dicampakan",
      "gender": "Laki-laki",
      "point": 85,
      "level": "A",
      "zodiac": "Gemini",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 35, 35),
        title: const Text('Dark Anime', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animeData.length,
        itemBuilder: (context, index) {
          final item = animeData[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade700),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    item['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["nama"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        item["desc"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailAnimeScreen(
                          nama: item["nama"],
                          anime: item["anime"],
                          image: item["image"],
                          desc: item["desc"],
                          gender: item["gender"],
                          point: item["point"],
                          level: item["level"],
                          zodiac: item["zodiac"],
                        ),
                      ),
                    );
                  },
                  child: const Text("Lihat"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
