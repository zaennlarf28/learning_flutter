import 'package:flutter/material.dart';
import 'package:flutter_zaenal/list_view/detail_wisata.dart'; // pastikan import ini benar

class AnimeScreen extends StatelessWidget {
  AnimeScreen({super.key});

  // data
  final List<Map<String, dynamic>> animeData = [
    {
      "nama": "Guts",
      "anime": "Berserk",
      "image": "images/guts.jpg",
      "desc": "Tersakiti",
    },
    {
      "nama": "Ikari Shinji",
      "anime": "Evangelion",
      "image": "images/ikari.jpg",
      "desc": "Stress",
    },
    {
      "nama": "Eren Yeager",
      "anime": "AOT",
      "image": "images/ren.jpg",
      "desc": "Bantai-bantai",
    },
    {
      "nama": "Thorfinn",
      "anime": "Vindland Saga",
      "image": "images/thorfin.jpg",
      "desc": "Budak",
    },
    {
      "nama": "Kaneki Ken",
      "anime": "Tokyo Ghoul",
      "image": "images/ken.jpg",
      "desc": "Tersakiti",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey, Colors.black],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView.builder(
          itemCount: animeData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailAnimeScreen(
                      nama: animeData[index]["nama"],
                      anime: animeData[index]["anime"],
                      image: animeData[index]["image"],
                      desc: animeData[index]["desc"],
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 200,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("${animeData[index]['image']}"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Text(
                    "${animeData[index]["nama"]} - ${animeData[index]["anime"]}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
