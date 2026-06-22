import 'package:flutter/material.dart';

class ContainerHistorico extends StatelessWidget {
  final String termo;

  const ContainerHistorico({super.key, required this.termo});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(termo),
      backgroundColor: const Color(0xFF5B21B6),
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}
