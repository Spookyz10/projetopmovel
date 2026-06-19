import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'busca.db';
    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {

    // tabela de filmes populares

    String sql = '''CREATE TABLE POPULAR (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql =
      "INSERT INTO Popular (titulo) VALUES ('Cidade de Deus');";
    await db.execute(sql);

    sql =
      "INSERT INTO Popular (titulo) VALUES ('Tropa de Elite');";
    await db.execute(sql);

    // tabela de histórico

    sql = '''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      termo TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql =
      "INSERT INTO Historico (termo) VALUES ('Bacurau');";
    await db.execute(sql);

    sql =
      "INSERT INTO Historico (termo) VALUES ('Carandiru');";
    await db.execute(sql);

    sql =
      "INSERT INTO Historico (termo) VALUES ('Agente Secreto');";
    await db.execute(sql);

    sql =
      "INSERT INTO Historico (termo) VALUES ('O Auto da compadecida');";
    await db.execute(sql);

  }
}


