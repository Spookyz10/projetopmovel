import 'package:flutter/material.dart';
import 'pages/splash_page.dart'; // Sem o "pages/" duplicado no caminho

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}