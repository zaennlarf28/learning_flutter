import 'package:flutter/material.dart';

class AnimeScreen extends StatelessWidget {
  AnimeScreen({super.key});

  // data
  final List<Map<String, dynamic>> animeData = [
    {
      "nama" : "Guts",
      "anime" : "Berserk",
      "image" : "assets/images/berserk.jpg",
      "desc" : "Tersakiti",
    },
    {
      "nama" : "Ikari Shinji",
      "anime" : "Evangelion",
      "image" : "assets/images/evangelion.jpg",
      "desc" : "Stress",
    },
    {
      "nama" : "Eren Yeager",
      "anime" : "AOT",
      "image" : "assets/images/aot.jpg",
      "desc" : "Bantai",
    },
    {
      "nama" : "Thorfinn",
      "anime" : "Vindland Saga",
      "image" : "assets/images/vindland.jpg",
      "desc" : "Balas Dendam",
    },
    {
      "nama" : "Kaneki Ken",
      "anime" : "Tokyo Ghoul",
      "image" : "assets/images/tokyoghoul.jpg",
      "desc" : "Tersakiti",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
              onTap: (){},
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage("${animeData[index]['image']}"),
                  fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Text(
                    "${animeData[index]["nama"]} - ${animeData[index]["anime"]}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14,
                    color: Colors.white),
                  ),
                ),
              ),
            );
          }),
      ),
    );
  }
}