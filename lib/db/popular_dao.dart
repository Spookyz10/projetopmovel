import 'package:project_c/db/db_helper.dart';
import 'package:project_c/domain/popular.dart';
import 'package:sqflite/sqflite.dart';

class PopularDao {
  Future<List<Popular>> listarPopular() async {
    Database db = await DBHelper().initDB();
    
    var listaResult = await db.rawQuery('SELECT * FROM POPULAR;');

    List<Popular> listaPopular = [];
    for (var json in listaResult){
      Popular popular = Popular.fromJson(json);
      listaPopular.add(popular);
    }
    return listaPopular;
  }
}