import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: HomePage(),
    ),
  );
}