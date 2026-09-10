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

  //List<Popular> listaPopular = [];
  //List<Historico> listaHistorico = [];
  late Future<List<Historico>> futureHistorico;
  late Future<List<Popular>> futurePopular;

  @override
  void initState() {
    super.initState();
    futureHistorico = HistoricoDao().listarHistorico();
    futurePopular = PopularDao().listarPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Histórico de Busca",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 45,
              child: FutureBuilder(
                future: futureHistorico,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Historico> listaHistorico = snapshot.requireData;
                    return buildHistoricoListView(listaHistorico);
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Resultados da Pesquisa",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: futurePopular,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Popular> listaPopular = snapshot.requireData;
                    return buildPopularListView(listaPopular);
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0E0E10),
      title: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Buscar filmes...",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }

  buildHistoricoListView(List<Historico> listaHistorico) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listaHistorico.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ContainerHistorico(termo: listaHistorico[i].termo),
        );
      },
    );
  }

  buildPopularListView(List<Popular> listaPopular) {
    return ListView.builder(
      itemCount: listaPopular.length,
      itemBuilder: (context, i) {
        return ContainerPopular(titulo: listaPopular[i].titulo);
      },
    );
  }
}
