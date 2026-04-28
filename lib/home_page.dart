import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'detalhes_page.dart';
import 'assistir_tarde.dart';
import 'busca_page.dart';
import 'feedback_page.dart';
import 'vistos_page.dart';
import 'favoritos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
    MainPage(),
    AssistirPage(),
    VistosPage(),
    FavoritosPage(),
    DetalhesPage(),
    ProfilePage(),
    BuscaPage(),
    FeedbackPage(),
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
              border: Border.all(color: Color(0xFF5B21B6), width: 4),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1A1026), Color(0xFF120A1D)],
              ),
            ),
            child: NavigationBar(
              backgroundColor: Colors.transparent,
              indicatorColor: Color(0xFF5B21B6),
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.home, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.explore, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.explore, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.star, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.favorite, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.favorite, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.message, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.message, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.person, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.search, color: Color(0xFFC084FC)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.feedback, color: Color(0xFF8B5CF6)),
                  selectedIcon: Icon(Icons.feedback, color: Color(0xFFC084FC)),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
