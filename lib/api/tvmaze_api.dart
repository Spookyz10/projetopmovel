import 'package:dio/dio.dart';
import 'package:project_c/domain/serie.dart';

class TvmazeApi {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Serie>> listarSeries() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        'https://api.tvmaze.com/shows',
        queryParameters: {'page': 0},
      );
      final data = response.data;
      if (data == null) throw const FormatException('Resposta vazia.');
      // A API pagina até 250 séries. A Home exibe somente os primeiros 12 itens.
      return data
          .take(12)
          .map((item) => Serie.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException {
      throw Exception(
        'Não foi possível carregar as séries. Verifique sua conexão.',
      );
    } on FormatException {
      throw Exception('A lista de séries chegou em um formato inesperado.');
    } on TypeError {
      throw Exception('A lista de séries chegou em um formato inesperado.');
    }
  }
}
