import 'package:dio/dio.dart';
import 'package:project_c/domain/popular.dart';

class BrasilApiFeriados {
  final dio = Dio();
  final baseUrl = 'https://brasilapi.com.br/api/feriados/v1';

  Future<List<Popular>> listarFeriados() async {
    final response = await dio.get('$baseUrl/2026');

    List<Popular> listaPopular = [];
    if (response.statusCode == 200) {
      for (var json in response.data) {
        Popular popular = Popular.fromJson(json);
        listaPopular.add(popular);
      }
    }
      return listaPopular;
  }
}