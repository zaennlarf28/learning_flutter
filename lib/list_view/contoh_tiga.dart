import 'package:flutter/material.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ListViewTiga extends StatelessWidget {
  ListViewTiga({super.key});

  // data
  final List<Color>colorList = [Colors.red, Colors.green, Colors.blue];
  final List<String>partaiList = [
    'Partai Banteng',
    'Partai Kebun',
    'Partai Joget',
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Contoh List View Builder',
      body: SizedBox(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 300,
              color: colorList[index],
              child: Center(child: Text(partaiList[index])),
            );
          }),
      ),
    );
  }
}