import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/configuracao.dart';
import 'package:sqflite/sqflite.dart';

class ConfiguracaoDao {
  Future<bool> getValor(String chave) async {
    Database db = await DBHelper().initDB();
    var result = await db.rawQuery(
      'SELECT valor FROM CONFIGURACAO WHERE chave = ?',
      [chave],
    );
    if (result.isNotEmpty) {
      return result.first['valor'] == 1;
    }
    return false;
  }

  Future<void> salvarValor(String chave, bool valor) async {
    Database db = await DBHelper().initDB();
    await db.rawUpdate('UPDATE CONFIGURACAO SET valor = ? WHERE chave = ?', [
      valor ? 1 : 0,
      chave,
    ]);
  }

  Future<List<Configuracao>> listarConfiguracoes() async {
    Database db = await DBHelper().initDB();
    var result = await db.rawQuery('SELECT * FROM CONFIGURACAO;');

    List<Configuracao> configuracoes = [];
    for (var json in result) {
      configuracoes.add(Configuracao.fromJson(json));
    }

    return configuracoes;
  }
}
