import 'package:flutter/material.dart';

class ContainerAssistir extends StatelessWidget {
  final String titulo;
  final String imagemPath;

  const ContainerAssistir({
    super.key,
    required this.titulo,
    required this.imagemPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imagemPath, fit: BoxFit.cover, width: 150, height: 200),
        Positioned(
          left: 15,
          bottom: 10,
          child: Text(
            titulo,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
