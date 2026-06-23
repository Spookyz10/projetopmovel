import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/historico.dart';
import 'package:sqflite/sqflite.dart';

class HistoricoDao {
  Future<List<Historico>> listarHistorico() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORICO;');

    List<Historico> listaHistorico = [];
    for (var json in listaResult) {
      listaHistorico.add(Historico.fromJson(json));
    }
    return listaHistorico;
  }
}
