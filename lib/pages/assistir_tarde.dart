import 'package:flutter/material.dart';
import 'package:project_c/db/assistir_mais_tarde_dao.dart';
import 'package:project_c/domain/assistir_mais_tarde.dart';

class AssistirPage extends StatefulWidget {
  const AssistirPage({super.key});

  @override
  State<AssistirPage> createState() => _AssistirPageState();
}

class _AssistirPageState extends State<AssistirPage> {
  final AssistirMaisTardeDao _dao = AssistirMaisTardeDao();
  List<AssistirMaisTarde> _lista = [];

  @override
  void initState() {
    super.initState();
    _carregarLista();
  }

  Future<void> _carregarLista() async {
    List<AssistirMaisTarde> lista = await _dao.listarAssistirMaisTarde();
    setState(() {
      _lista = lista;
    });
  }

  Future<void> _remover(String titulo) async {
    await _dao.removerAssistirMaisTarde(titulo);
    _carregarLista();
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
      body: _lista.isEmpty
          ? Center(
              child: Text(
                "Nenhum filme na lista.",
                style: TextStyle(color: Colors.white54),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: _lista.length,
              itemBuilder: (context, index) {
                AssistirMaisTarde filme = _lista[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1026),
                    border: Border.all(color: Color(0xFF5B21B6)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.asset(
                          filme.urlimage,
                          width: 90,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 90,
                                height: 120,
                                color: Color(0xFF2D1B4E),
                                child: Icon(Icons.movie, color: Colors.white38),
                              ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          filme.titulo,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Color(0xFFEC4899),
                        ),
                        onPressed: () => _remover(filme.titulo),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
