//KET
// serve para fazer a autenticação dos dados, se esta ou n cadastrado
import 'package:project_c/domain/propriedade.dart';
import'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  final baseUrl = 'https://raw.githubusercontent.com/LK-K7/fake_api/main/users.json';

  Future<List<Propriedade>> listarPropriedades() async {
      final response = await dio.get('$baseUrl/propriedades');

      List<Propriedade> listaPropriedades = [];
      for (var json in response.data) {
        Propriedade propriedade = Propriedade.fromJson(json);

        listaPropriedades.add(propriedade);
      }

      await Future.delayed(Duration(seconds: 5));
      return listaPropriedades;
  }
}