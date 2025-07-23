import 'package:flutter/material.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Satu',
      body: Container(
        width: 200,
        height: 100,
        margin: EdgeInsets.all(10),
        color: Color.fromARGB(255, 61, 155, 227),
        child: Center(child: Text("Hello")),
      ),
    );
  }
}
