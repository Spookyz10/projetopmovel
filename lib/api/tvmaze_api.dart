import 'package:dio/dio.dart';
import 'package:project_c/domain/serie.dart';
import 'package:project_c/domain/movie_details.dart';

class TvmazeApi {
  final Dio _dio;

  TvmazeApi({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

  Future<MovieDetails> getMovieDetails({int showId = 80233}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://api.tvmaze.com/shows/$showId',
        queryParameters: {'embed': 'cast'},
      );
      final data = response.data;
      if (data == null) throw const FormatException('Resposta vazia.');
      return MovieDetails.fromJson(data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        throw Exception('Título não encontrado na TVMaze.');
      }
      throw Exception(
        'Não foi possível consultar a TVMaze. Verifique sua conexão.',
      );
    } on FormatException {
      throw Exception('Os detalhes chegaram em um formato inesperado.');
    } on TypeError {
      throw Exception('Os detalhes chegaram em um formato inesperado.');
    }
  }

  Future<List<Serie>> listarSeries() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        'https://api.tvmaze.com/shows',
        queryParameters: {'page': 0},
      );
      final data = response.data;
      if (data == null) throw const FormatException('Resposta vazia.');

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
