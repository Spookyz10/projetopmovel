import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'busca.db';
    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 2, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    // tabela de filmes populares

    String sql = '''CREATE TABLE POPULAR (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql = "INSERT INTO Popular (titulo) VALUES ('Cidade de Deus');";
    await db.execute(sql);

    sql = "INSERT INTO Popular (titulo) VALUES ('Tropa de Elite');";
    await db.execute(sql);

    // tabela de histórico

    sql = '''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      termo TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql = "INSERT INTO Historico (termo) VALUES ('Bacurau');";
    await db.execute(sql);

    sql = "INSERT INTO Historico (termo) VALUES ('Carandiru');";
    await db.execute(sql);

    sql = "INSERT INTO Historico (termo) VALUES ('Agente Secreto');";
    await db.execute(sql);

    sql = "INSERT INTO Historico (termo) VALUES ('O Auto da compadecida');";
    await db.execute(sql);

    sql = '''CREATE TABLE USUARIO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL
    );''';

    await db.execute(sql);

    sql = "INSERT INTO USUARIO (username) VALUES ('Usuario');";
    await db.execute(sql);

    /*KET DATABASE*/
    sql = ''' CREATE TABLE PROPRIEDADE (
           id INTEGER PRIMARY KEY AUTOINCREMENT,
           urlimage TEXT,
           filme TEXT,
           ano TEXT,
           genero TEXT,
           nota REAL,
           favorito INTEGER
        );''';
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AbrilDespedacado.png', 'Abril Despedaçado', '2001', 'Drama', 4, 1);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AHoraDaEstrela.png', 'A Hora da Estrela', '1985', 'Drama', 5, 1);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/AMulherDeTodos.png', 'A Mulher de Todos', '1969', 'Comédia / Drama', 3, 0);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/ByeByeBrasil.png', 'Bye Bye Brasil', '1979', 'Drama / Aventura', 4, 1);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/CentralDoBrasil.png', 'Central do Brasil', '1998', 'Drama', 5, 0);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/CidadeDeDeus.png', 'Cidade de Deus', '2002', 'Drama / Crime', 5, 1);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/OAutoDaCompadecida.png', 'O Auto da Compadecida', '2000', 'Comédia / Drama', 4, 1);";
    await db.execute(sql);

    sql = "INSERT INTO PROPRIEDADE (urlimage, filme, ano, genero, nota, favorito) VALUES ('assets/OCangaceiro.png', 'O Cangaceiro', '1953', 'Drama / Faroeste', 3, 0);";
    await db.execute(sql);
  }
}
//1 é favorito, 0 filme não favorito

