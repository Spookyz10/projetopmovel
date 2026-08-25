//KET
import 'package:sqflite/sqflite.dart';
import '../db/db_helper.dart';
import'package:project_c/domain/user.dart'

class UserDao {
  Future<bool> login(String username, String password) async {
    Database db = await DBHelper().initDB();

    var result = await db.query(
      'USER',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return result.isNotEmpty;
  }

  save(User user) async {
    Database db = await DBHelper().initDB();
    await db.insert('USER', user.toJson());
  }
}