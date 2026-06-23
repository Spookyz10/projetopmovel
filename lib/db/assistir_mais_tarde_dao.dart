import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/assistir_mais_tarde.dart';
import 'package:sqflite/sqflite.dart';

class AssistirMaisTardeDao {
  Future<List<AssistirMaisTarde>> listarAssistirMaisTarde() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('''
      SELECT A.titulo, P.urlimage
      FROM ASSISTIR_MAIS_TARDE A
      LEFT JOIN PROPRIEDADE P ON P.filme = A.titulo;
    ''');

    List<AssistirMaisTarde> lista = [];
    for (var json in listaResult) {
      lista.add(AssistirMaisTarde.fromJson(json));
    }
    return lista;
  }

  Future<void> inserirAssistirMaisTarde(AssistirMaisTarde filme) async {
    Database db = await DBHelper().initDB();

    await db.rawInsert(
      'INSERT OR IGNORE INTO ASSISTIR_MAIS_TARDE (titulo) VALUES (?);',
      [filme.titulo],
    );
  }

  Future<void> removerAssistirMaisTarde(String titulo) async {
    Database db = await DBHelper().initDB();

    await db.rawDelete('DELETE FROM ASSISTIR_MAIS_TARDE WHERE titulo = ?;', [
      titulo,
    ]);
  }
}
