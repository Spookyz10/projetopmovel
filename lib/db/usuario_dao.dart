import 'package:project_c/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao {
  Future<String> getUsername() async {
    Database db = await DBHelper().initDB();
    var result = await db.rawQuery('SELECT username FROM USUARIO LIMIT 1;');
    if (result.isNotEmpty) {
      return result.first['username'] as String;
    }
    return 'Usuario';
  }

  Future<void> salvarUsername(String novoNome) async {
    Database db = await DBHelper().initDB();
    await db.rawUpdate('UPDATE USUARIO SET username = ?', [novoNome]);
  }
}
