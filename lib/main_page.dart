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
                    'assets/avengers.jpg',
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
                      "Avengers",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 20),
        
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Populares",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
        
              SizedBox(height: 10),
        
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
        
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
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
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
        
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
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
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
        
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
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
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ),
        
                  SizedBox(width: 23),
                  Container(
                    child: Image.asset(
                      'assets/avengers.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
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
