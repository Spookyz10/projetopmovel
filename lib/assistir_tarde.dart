import 'package:flutter/material.dart';

class AssistirPage extends StatefulWidget {
  const AssistirPage({super.key});

  @override
  State<AssistirPage> createState() => _AssistirPageState();
}

class _AssistirPageState extends State<AssistirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E0E10),
        centerTitle: true,
        title: Text("Assistir mais tarde", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [

              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/AHoraDaEstrela.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "A Hora da Estrela",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                )
              ), 

              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/AMulherDeTodos.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "A Mulher de Todos",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                )
              ), 

              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/CentralDoBrasil.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "Central do Brasil",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                )
              ), 

              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/OAutoDaCompadecida.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "O Auto da Compadecida",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                )
              ), 

              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/OCangaceiro.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "O Cangaceiro",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                )
              ), 

            
            ],
          ),
        ),
      ),
    );
  }
}