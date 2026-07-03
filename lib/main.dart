
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const GermanAIPro());
}

class GermanAIPro extends StatelessWidget {
  const GermanAIPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'German AI Pro',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6D28D9),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
