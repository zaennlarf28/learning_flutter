import 'package:flutter/material.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ListItem{
  final Color color;
  final String text;

  ListItem(this.color, this.text);
}

class ListViewEmpat extends StatelessWidget {
  ListViewEmpat({super.key});

  final List<ListItem> itemList = [
    ListItem(Colors.red, 'Partai Banteng'),
    ListItem(Colors.green, 'Partai Kebun'),
    ListItem(Colors.blue, 'Partai Joget'),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'List View Separated',
      body: SizedBox(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(color: Colors.black,);
          },
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 100,
              color: itemList[index].color,
              child: Center(child: Text(itemList[index].text)),
            );
          },
          itemCount: itemList.length),
      ),
    );
  }
}