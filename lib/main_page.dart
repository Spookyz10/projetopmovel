import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/CidadeDeDeus.png',
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
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 300,
                    child: Text(
                      "Cidade de Deus",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/CidadeDeDeus.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/OAutoDaCompadecida.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/OLoboAtrasDaPorta.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ação",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/TropaDeElite.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/OCangaceiro.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/OInvasor.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Comedia",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/AMulherDeTodos.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/OPalhaco.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/ByeByeBrasil.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Romance",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/CentralDoBrasil.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/AbrilDespedacado.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                  SizedBox(width: 23),
                  Image.asset(
                    'assets/AHoraDaEstrela.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}