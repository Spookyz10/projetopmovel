//KET
import 'package:flutter/material.dart';
import 'package:project_c/db/shared_prefs.dart';
import 'package:project_c/api/propriedades_api.dart';
import 'package:project_c/domain/user.dart';
import 'package:project_c/pages/home_page.dart';
import 'package:project_c/db/user_dao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPrefs prefs = SharedPrefs();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.movie_creation_outlined,
                size: 72,
                color: Color(0xFF8B5CF6),
              ),
              const SizedBox(height: 16),
              const Text(
                'Entre na sua conta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              // usuário:
              TextField(
                //vincula a caixinha ao controlador do usuario
                controller: userController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                  focusedBorder: buildUserOutlineInputBorder(),
                  enabledBorder: buildUserOutlineInputBorder(),
                ),
              ),

              // senha:
              TextField(
                controller: passwordController,
                // pontinhos
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  enabledBorder: buildPasswordOutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Botão:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                //executa a validação ao ser clicado
                onPressed: onPressed,
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    // chama a authapi
    bool isAuth = await UserDao().login(username, password);

    // se a api retornar um objeto válido, faz o login
    if (isAuth) {
      //salva o estado
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );

      prefs.setUserStatus(true);
    } else {
      print('User e/ou passsword incorretos');
    }
  }

  //circulo
  OutlineInputBorder buildUserOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    );
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
    );
  }
}