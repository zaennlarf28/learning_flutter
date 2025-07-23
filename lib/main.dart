import 'package:flutter/material.dart';
import 'package:flutter_zaenal/anime_screen.dart';
import 'package:flutter_zaenal/container/dua.dart';
import 'package:flutter_zaenal/container/satu.dart';
import 'package:flutter_zaenal/container/tiga.dart';
import 'package:flutter_zaenal/list_view/contoh_dua.dart';
import 'package:flutter_zaenal/list_view/contoh_empat.dart';
import 'package:flutter_zaenal/list_view/contoh_satu.dart';
import 'package:flutter_zaenal/list_view/contoh_tiga.dart';
import 'package:flutter_zaenal/row_column/column_satu.dart';
import 'package:flutter_zaenal/row_column/latihan_satu.dart';
import 'package:flutter_zaenal/row_column/row_column.dart';
import 'package:flutter_zaenal/row_column/row_satu.dart';

void main() {
  runApp(BelajarFlutter());
}

class BelajarFlutter extends StatelessWidget {
  const BelajarFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimeScreen(),
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello Andoy', style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.blue,
      ),),
    );
  }
}