import 'package:flutter/material.dart';
import 'package:flutter_zaenal/container/satu.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ContainerDua extends StatelessWidget {
  const ContainerDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Dua',
      body: Container(
        color: Color.fromARGB(255, 64, 66, 67), // Warna untuk area margin
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.grey, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [BoxShadow(color: Colors.black,
            spreadRadius: 2)],
          ),
          child: Center(
            child: ElevatedButton(
              child: Text("Pindah ke Container Satu"),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerSatu()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
