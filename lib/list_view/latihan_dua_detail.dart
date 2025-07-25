import 'package:flutter/material.dart';
import 'package:flutter_zaenal/main_layout.dart';

class DetailAnimeScreen extends StatelessWidget {
  final String nama;
  final String anime;
  final String image;
  final String desc;
  final String gender;
  final int point;
  final String level;
  final String zodiac;

  const DetailAnimeScreen({
    super.key,
    required this.nama,
    required this.anime,
    required this.image,
    required this.desc,
    required this.gender,
    required this.point,
    required this.level,
    required this.zodiac,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: nama,
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 48, 48, 48),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "$nama - $anime",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 4,
                  radius: const Radius.circular(10),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          detailItem(Icons.person, "Gender", gender),
                          detailItem(Icons.stars, "Level", level),
                          detailItem(Icons.favorite, "Zodiak", zodiac),
                          detailItem(Icons.score, "Point", point.toString()),
                          const SizedBox(height: 12),
                          const Text(
                            "Bio:",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              desc,
                              style: const TextStyle(
                                fontSize: 15.5,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.tealAccent),
          const SizedBox(width: 10),
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15.5,
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
