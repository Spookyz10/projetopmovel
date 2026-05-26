import 'package:flutter/material.dart';

class BuscaPage extends StatefulWidget {
  const BuscaPage({super.key});
  @override
  State<BuscaPage> createState() => _BuscaPageState();
}

class _BuscaPageState extends State<BuscaPage> {
  TextEditingController controller = TextEditingController();
  final List<String> history = ["Cidade de Deus", "Tropa de Elite"];
  final List<String> popular = [
    "Bacurau",
    "Carandiru",
    "Agente Secreto",
    "O Auto da compadecida",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E10),
        title: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Buscar filmes...",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            controller.clear();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // historico fixo
            Text(
              "Histórico de Busca",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: history.map((termo) {
                return Chip(
                  label: Text(termo),
                  backgroundColor: const Color(0xFF5B21B6),
                  labelStyle: TextStyle(color: Colors.white),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            // mais pesquisados
            Text(
              "Mais pesquisados",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: popular.map((movie) {
                  return ListTile(
                    leading: Icon(Icons.movie, color: Color(0xFF7C3AED)),
                    title: Text(movie, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
