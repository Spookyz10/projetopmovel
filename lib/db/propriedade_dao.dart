import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/propriedade.dart';
import 'package:sqflite/sqflite.dart';

class PropriedadeDao {
  // parte de alvaro mateus

  Future<void> toggleFavorito(String filme, int valor) async {
    Database db = await DBHelper().initDB();
    await db.rawUpdate('UPDATE PROPRIEDADE SET favorito = ? WHERE filme = ?;', [
      valor,
      filme,
    ]);
  } // fim da parte de alvaro mateus

  Future<List<Propriedade>> listarPropriedades() async {
    // db
    Database db = await DBHelper().initDB();

    // consultando oq pedi, as propriedades ou favoritos
    var listaResult = await db.rawQuery('SELECT * FROM PROPRIEDADE;');

    //cria uma lista vazia pra procurar oq quero
    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      Propriedade propriedade = Propriedade.fromJson(json);

      // coloca a propriedade ou favoritos na Lista
      listaPropriedades.add(propriedade);
    }
    return listaPropriedades;
    ;
  }

  // favoritos
  Future<List<Propriedade>> listarFavoritos() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery(
      'SELECT * FROM PROPRIEDADE WHERE favorito = 1;',
    );

    List<Propriedade> lista = [];

    for (var json in listaResult) {
      lista.add(Propriedade.fromJson(json));
    }

    return lista;
  }
}
