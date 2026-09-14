import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const CineBrasilApp());
}

class CineBrasilApp extends StatelessWidget {
  const CineBrasilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cine Brasil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C3AED),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
