import 'package:flutter/material.dart';
import 'tab_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.menu),
            SizedBox(width: 8),
            Text("Chico State"),
          ],
        ),
      ),
      body: const TabScreen(),
    );
  }
}
