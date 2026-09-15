// Serve para análisar se o usúario já esteve conectado antes
//e n precise passar pela tela de login dnv,
//KET
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // aq ele salva o status de login
  Future<void> setUserStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('USER', value);
  }

  // ele busca o status de login, devolve true ou false
  Future<bool> getUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //aq ele l~e oq esta guardado em user, se for a primeira vez estara null
    bool? status = prefs.getBool('USER');

    // se escontrar algo, ele devolve (true ou false), caso null ele devolve false
    return status ?? false;
  }
}