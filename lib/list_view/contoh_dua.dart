import 'package:flutter/material.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ListViewDua extends StatelessWidget {
  const ListViewDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Contoh List View Builder',
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.all(10),
            color: Colors.grey[(index + 1) * 100],
            child: FlutterLogo(),
          );
        }),
    );
  }
}