import 'package:flutter/material.dart';
import 'package:project_c/db/assistir_mais_tarde_dao.dart';
import 'package:project_c/db/propriedade_dao.dart';
import 'package:project_c/domain/assistir_mais_tarde.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final AssistirMaisTardeDao _assistirDao = AssistirMaisTardeDao();
  final PropriedadeDao _propriedadeDao = PropriedadeDao();

  static const String _tituloFilme = 'O Auto da Compadecida';
  bool _naLista = false;
  bool _favorito = false;

  @override
  void initState() {
    super.initState();
    _verificarNaLista();
    _verificarFavorito();
  }

  Future<void> _verificarNaLista() async {
    final lista = await _assistirDao.listarAssistirMaisTarde();
    final estaNA = lista.any((f) => f.titulo == _tituloFilme);
    setState(() => _naLista = estaNA);
  }

  Future<void> _verificarFavorito() async {
    final lista = await _propriedadeDao.listarPropriedades();
    final prop = lista.firstWhere((p) => p.filme == _tituloFilme);
    setState(() => _favorito = prop.favorito == 1);
  }

  Future<void> _toggleAssistirMaisTarde() async {
    if (_naLista) {
      await _assistirDao.removerAssistirMaisTarde(_tituloFilme);
    } else {
      await _assistirDao.inserirAssistirMaisTarde(
        AssistirMaisTarde(titulo: _tituloFilme),
      );
    }
    setState(() => _naLista = !_naLista);
  }

  Future<void> _toggleFavorito() async {
    final novoValor = _favorito ? 0 : 1;
    await _propriedadeDao.toggleFavorito(_tituloFilme, novoValor);
    setState(() => _favorito = !_favorito);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Color(0xFF0E0E10),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detalhes do Filme",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/OAutoDaCompadecida.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350,
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xFF120A1D)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 16,
                  child: Row(
                    children: [
                      buildGenero(nome: "Comedia"),
                      SizedBox(width: 10),
                      buildGenero(nome: "Drama"),
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 16,
                  child: Text(
                    _tituloFilme,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xFF3E1A63), thickness: 2),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF7C3AED).withValues(alpha: 0.2),
                          border: Border.all(color: Color(0xFF7C3AED)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFFB98CFF)),
                            Text(
                              "8.6",
                              style: TextStyle(
                                color: Color(0xFFB98CFF),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF5B21B6).withValues(alpha: 0.2),
                          border: Border.all(color: Color(0xFF5B21B6)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Color(0xFFC084FC),
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "1H 44MIN",
                              style: TextStyle(
                                color: Color(0xFFC084FC),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF5B21B6).withValues(alpha: 0.2),
                          border: Border.all(color: Color(0xFF5B21B6)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Color(0xFFC084FC),
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "12+",
                              style: TextStyle(
                                color: Color(0xFFC084FC),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color(0xFF3E1A63), thickness: 2),
                  SizedBox(height: 6),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                            label: Text(
                              "Assistir Agora!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: _favorito
                                ? Color(0xFFEC4899).withValues(alpha: 0.2)
                                : Color(0xFF5B21B6).withValues(alpha: 0.2),
                            border: Border.all(
                              color: _favorito
                                  ? Color(0xFFEC4899)
                                  : Color(0xFF5B21B6),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: IconButton(
                            icon: Icon(
                              _favorito ? Icons.star : Icons.star_border,
                              color: _favorito
                                  ? Color(0xFFEC4899)
                                  : Colors.white,
                            ),
                            onPressed: _toggleFavorito,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF5B21B6).withValues(alpha: 0.2),
                            border: Border.all(
                              color: Color(0xFF5B21B6),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.thumb_up_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: _naLista
                                ? Color(0xFFEC4899).withValues(alpha: 0.2)
                                : Color(0xFF5B21B6).withValues(alpha: 0.2),
                            border: Border.all(
                              color: _naLista
                                  ? Color(0xFFEC4899)
                                  : Color(0xFF5B21B6),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.watch_later,
                              color: _naLista
                                  ? Color(0xFFEC4899)
                                  : Colors.white,
                            ),
                            onPressed: _toggleAssistirMaisTarde,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color(0xFF3E1A63), thickness: 2),
                  SizedBox(height: 9),
                  Text(
                    "SINOPSE",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.3),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. Eles enfrentam cangaceiros, um padeiro avarento e até um julgamento divino, sempre com muito humor e críticas sociais.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGenero({required String nome}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    decoration: BoxDecoration(
      color: Color(0xFF0E0E10).withValues(alpha: 0.8),
      border: Border.all(color: Color(0xFF8B5CF6)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      nome.toUpperCase(),
      style: TextStyle(
        color: Color(0xFFB98CFF),
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
