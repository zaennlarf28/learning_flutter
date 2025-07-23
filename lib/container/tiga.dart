import 'package:flutter/material.dart';
import 'package:flutter_zaenal/container/dua.dart';
import 'package:flutter_zaenal/main_layout.dart';

class ContainerTiga extends StatefulWidget {
  const ContainerTiga({super.key});

  @override
  State<ContainerTiga> createState() => _ContainerTigaState();
}

class _ContainerTigaState extends State<ContainerTiga>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animationBegin;
  late Animation<Alignment> _animationEnd;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // lebih lambat
      vsync: this,
    )..repeat(reverse: true);

    _animationBegin = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));

    _animationEnd = Tween<Alignment>(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Tiga',
      body: Container(
        color: const Color.fromARGB(255, 64, 66, 67),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: _animationBegin.value,
                  end: _animationEnd.value,
                  colors: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black, spreadRadius: 2),
                ],
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContainerDua()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 184, 91, 195),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Pindah ke Container Dua"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
