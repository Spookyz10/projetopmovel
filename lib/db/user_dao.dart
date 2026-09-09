//KET
import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Future<bool> login(String username, String password) async {
    Database db = await DBHelper().initDB();
    String sql = '''
        SELECT *
        FROM USER
        WHERE username = ? AND password = ?;
    ''';

    var result = await db.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }

  save(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
}