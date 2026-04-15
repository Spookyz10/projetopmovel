import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  final String nomeFilme;
  final String imagem;
  final String description;
  final String duracao;
  final String avaliacao;

  const DetalhesPage({
    super.key,
    required this.nomeFilme,
    required this.imagem,
    required this.description,
    required this.duracao,
    required this.avaliacao,
  });

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 27, 45),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Color(0xFF1C2942),
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
      body: Column(
        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1C2942),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF344973), width: 5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.nomeFilme,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(widget.imagem, width: 400, height: 400),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1C2942),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF344973), width: 5),
                      ),
                      child: Text(
                        "Duração: ${widget.duracao}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    SizedBox(width: 30),

                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1C2942),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF344973), width: 5),
                      ),
                      child: Text(
                        "Avaliação: ${widget.avaliacao}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  child:  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1C2942),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF344973), width: 5),
                      ),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
