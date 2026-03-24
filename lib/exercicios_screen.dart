import 'package:flutter/material.dart';

class ExerciciosScreen extends StatelessWidget {
  const ExerciciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercícios")),
      body: Center(
        child: Text("Tela de Exercício para C#"),
      ),
    );
  }
}