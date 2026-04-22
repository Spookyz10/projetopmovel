import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_c/favoritos_page.dart';
import 'explorer_page.dart';
import 'profile_page.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
    ExplorerPage(),
    Center(child: Text('Navigation')),
    FavoritosPage(),
    Center(child: Text('Airbnb')),
    DetalhesPage(
      nomeFilme: "Vingadores Ultimato",
      imagem: 'assets/avengers.jpg',
      description:
          "Em Vingadores: Ultimato, após Thanos eliminar metade das criaturas vivas em Vingadores: Guerra Infinita, os heróis precisam lidar com a dor da perda de amigos e seus entes queridos. Com Tony Stark (Robert Downey Jr.) vagando perdido no espaço sem água nem comida, o Capitão América/Steve Rogers (Chris Evans) e a Viúva Negra/Natasha Romanov (Scarlett Johansson) precisam liderar a resistência contra o titã louco.",
      duracao: "3 Horas",
      avaliacao: "4.5",
      pg: "13+",
      genero1: "Ação",
      genero2: "Thriller",
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: pages[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF5B21B6),
                width: 4,
              ),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1026),
                  Color(0xFF120A1D),
                ],
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: Color(0xFFC084FC),
              elevation: 0,
              unselectedItemColor: Color(0xFF8B5CF6).withValues(alpha: 0.7),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Navigation',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favoritos',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.airbnb),
                  label: 'Trips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
