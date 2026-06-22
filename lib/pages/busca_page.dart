import 'package:flutter/material.dart';
import 'package:project_c/db/popular_dao.dart';
import 'package:project_c/db/historico_dao.dart';
import 'package:project_c/domain/popular.dart';
import 'package:project_c/domain/historico.dart';
import 'package:project_c/widget/container_popular.dart';
import 'package:project_c/widget/container_historico.dart';

class BuscaPage extends StatefulWidget {
  const BuscaPage({super.key});

  @override
  State<BuscaPage> createState() => _BuscaPageState();
}
class _BuscaPageState extends State<BuscaPage> {
  TextEditingController controller = TextEditingController();

  List<Popular> listaPopular = [];
  List<Historico> listaHistorico = [];

  @override
  void initState() {
    super.initState();
  }

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
            // histórico
            Text(
              "Histórico de Busca",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: listaHistorico.length,
                itemBuilder: (context, index) {
                  return ContainerHistorico(termo: listaHistorico[index].termo);
                },
              ),
            ),
            SizedBox(height: 30),

            // populares
            Text(
              "Mais pesquisados",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: listaPopular.length,
                itemBuilder: (context, index) {
                  return ContainerPopular(titulo: listaPopular[index].titulo);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

