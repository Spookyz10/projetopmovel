// Serve para análisar se o usúario já esteve conectado antes
//e n precise passar pela tela de login.
//KET
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setUserStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('USER', value);
  }

  Future<bool> getUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool('USER');

    return status ?? false;
  }
}