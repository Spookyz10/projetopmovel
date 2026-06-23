import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'busca.db');

    return await openDatabase(
      dbPath,
      version: 4,
      onCreate: onCreateDB,
      onUpgrade: onUpgradeDB,
    );
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    await db.execute('''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      termo TEXT NOT NULL
    );''');

    await db.execute(
      "INSERT INTO HISTORICO (termo) VALUES ('Cidade de Deus');",
    );
    await db.execute(
      "INSERT INTO HISTORICO (termo) VALUES ('Tropa de Elite');",
    );

    await db.execute('''CREATE TABLE POPULAR (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL
    );''');

    await db.execute("INSERT INTO POPULAR (titulo) VALUES ('Bacurau');");
    await db.execute("INSERT INTO POPULAR (titulo) VALUES ('Carandiru');");
    await db.execute("INSERT INTO POPULAR (titulo) VALUES ('Agente Secreto');");
    await db.execute(
      "INSERT INTO POPULAR (titulo) VALUES ('O Auto da Compadecida');",
    );

    await db.execute('''CREATE TABLE USUARIO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL
    );''');

    await db.execute("INSERT INTO USUARIO (username) VALUES ('Usuario');");

    await db.execute('''CREATE TABLE PROPRIEDADE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      urlimage TEXT,
      filme TEXT,
      ano TEXT,
      genero TEXT,
      nota REAL,
      favorito INTEGER
    );''');

    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AbrilDespedacado.png', 'Abril Despedaçado', '2001', 'Drama', 4, 1);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AHoraDaEstrela.png', 'A Hora da Estrela', '1985', 'Drama', 5, 1);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AMulherDeTodos.png', 'A Mulher de Todos', '1969', 'Comédia / Drama', 3, 0);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/ByeByeBrasil.png', 'Bye Bye Brasil', '1979', 'Drama / Aventura', 4, 1);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/CentralDoBrasil.png', 'Central do Brasil', '1998', 'Drama', 5, 0);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/CidadeDeDeus.png', 'Cidade de Deus', '2002', 'Drama / Crime', 5, 1);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/OAutoDaCompadecida.png', 'O Auto da Compadecida', '2000', 'Comédia / Drama', 4, 1);",
    );
    await db.execute(
      "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/OCangaceiro.png', 'O Cangaceiro', '1953', 'Drama / Faroeste', 3, 0);",
    );

    await db.execute('''CREATE TABLE CONFIGURACAO (
      chave TEXT PRIMARY KEY,
      valor TEXT NOT NULL
    );''');

    await db.execute(
      "INSERT INTO CONFIGURACAO (chave, valor) VALUES ('full_screen', '0');",
    );
    await db.execute(
      "INSERT INTO CONFIGURACAO (chave, valor) VALUES ('notificacoes', '0');",
    );

    await db.execute('''CREATE TABLE ASSISTIR_MAIS_TARDE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL UNIQUE
    );''');
  }

  FutureOr<void> onUpgradeDB(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion < 3) {
      await db.execute('''CREATE TABLE IF NOT EXISTS CONFIGURACAO (
        chave TEXT PRIMARY KEY,
        valor TEXT NOT NULL
      );''');
      await db.execute(
        "INSERT OR IGNORE INTO CONFIGURACAO (chave, valor) VALUES ('full_screen', '0');",
      );
      await db.execute(
        "INSERT OR IGNORE INTO CONFIGURACAO (chave, valor) VALUES ('notificacoes', '0');",
      );
    }

    if (oldVersion < 4) {
      await db.execute('''CREATE TABLE IF NOT EXISTS ASSISTIR_MAIS_TARDE (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL UNIQUE
      );''');
    }
  }
}
