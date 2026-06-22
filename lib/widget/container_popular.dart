import 'package:flutter/material.dart';

class ContainerPopular extends StatelessWidget {
  final String titulo;

  const ContainerPopular({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.movie, color: Color(0xFF7C3AED)),
      title: Text(
        titulo,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
