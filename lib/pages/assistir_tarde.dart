import 'package:flutter/material.dart';
import 'package:project_c/db/assistir_mais_tarde_dao.dart';
import 'package:project_c/domain/assistir_mais_tarde.dart';
import 'package:project_c/widget/container_assistir.dart';

class AssistirPage extends StatefulWidget {
  const AssistirPage({super.key});

  @override
  State<AssistirPage> createState() => _AssistirPageState();
}

class _AssistirPageState extends State<AssistirPage> {
  final AssistirMaisTardeDao dao = AssistirMaisTardeDao();
  List<AssistirMaisTarde> filmes = [];

  final Map<String, String> imagens = {
    "A Hora da Estrela": "assets/AHoraDaEstrela.png",
    "A Mulher de Todos": "assets/AMulherDeTodos.png",
    "Central do Brasil": "assets/CentralDoBrasil.png",
    "O Auto da Compadecida": "assets/OAutoDaCompadecida.png",
    "O Cangaceiro": "assets/OCangaceiro.png",
  };

  @override
  void initState() {
    super.initState();
    carregarFilmes();
  }

  void carregarFilmes() async {
    List<AssistirMaisTarde> lista = await dao.listarAssistirMaisTarde();
    setState(() {
      filmes = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E0E10),
        centerTitle: true,
        title: Text(
          "Assistir mais tarde",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: filmes.isEmpty
            ? Center(
                child: Text(
                  "Nenhum filme adicionado ainda",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: filmes.map((filme) {
                    return ContainerAssistir(
                      titulo: filme.titulo,
                      imagemPath:
                          imagens[filme.titulo] ??
                          'assets/OAutoDaCompadecida.png',
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}
