import 'package:dio/dio.dart';
import 'package:project_c/domain/historico.dart';

class HistoricoApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/sgs12-star/fake_api_historico';

  Future<List<Historico>> listarHistorico() async {
    final response = await dio.get('$baseUrl/historico');

    List<Historico> listaHistorico = [];
    if (response.statusCode == 200) {
      for (var json in response.data) {
        Historico historico = Historico.fromJson(json);
        listaHistorico.add(historico);
      }
    }

    return listaHistorico;
  }
}