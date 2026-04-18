import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  final String nomeFilme;
  final String imagem;
  final String description;
  final String duracao;
  final String avaliacao;
  final String pg;
  final String? genero1;
  final String? genero2;

  const DetalhesPage({
    super.key,
    required this.nomeFilme,
    required this.imagem,
    required this.description,
    required this.duracao,
    required this.avaliacao,
    required this.pg,
    this.genero1,
    this.genero2,
  });

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
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
                  widget.imagem,
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
                      if (widget.genero1 != null && widget.genero1!.isNotEmpty)
                        buildGenero(nome: widget.genero1!),

                      SizedBox(width: 10),

                      if (widget.genero2 != null && widget.genero2!.isNotEmpty)
                        buildGenero(nome: widget.genero2!),
                    ],
                  ),
                ),

                Positioned(
                  top: 300,
                  left: 16,
                  child: Text(
                    widget.nomeFilme,
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
                          border: BoxBorder.all(
                            color: Color(0xFF7C3AED),
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFB98CFF),
                            ),
                            Text(
                              widget.avaliacao.toUpperCase(),
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
                          border: BoxBorder.all(color: Color(0xFF5B21B6)),
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
                              widget.duracao.toUpperCase(),
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
                          border: BoxBorder.all(color: Color(0xFF5B21B6)),
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
                              widget.pg.toUpperCase(),
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
                      Container(
                        height: 60,
                        width: 300,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF8B5CF6),
                              Color(0xFF6D28D9),
                            ],
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
                            elevation: 0,
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF5B21B6).withValues(alpha: 0.2),
                          border: BoxBorder.all(
                            color: Color(0xFF5B21B6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.star_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),

                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF5B21B6).withValues(alpha: 0.2),
                          border: BoxBorder.all(
                            color: Color(0xFF5B21B6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.thumb_up_outlined, color: Colors.white),
                          onPressed: () {},
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
                    widget.description,
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

buildGenero({required String nome}) {
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
