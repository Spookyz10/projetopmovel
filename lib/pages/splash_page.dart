//KET
//primeira tea q vamos ver ao abrir o app
import 'package:project_c/db/shared_prefs.dart';
import 'package:project_c/pages/home_page.dart';
import 'package:project_c/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  //mandar consultar o status do login
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    //inicia a verificação e o time
    loadData();
  }

  loadData() async {
    //assincrona, ja sabe para onde ir
    //busca se ele ja esta logado
    bool status = await prefs.getUserStatus();
    //ele atrsa de proposito
    await Future.delayed(Duration(seconds: 3));

    //se for true, home
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF9239FE), // Corrigido para 8 dígitos
      body: Center(
        child: Icon(
          Icons.movie,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}