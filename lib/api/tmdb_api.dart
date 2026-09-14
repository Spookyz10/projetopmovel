import 'package:dio/dio.dart';
import 'package:project_c/domain/movie_details.dart';

class TmdbApi {
  static const String _accessToken = String.fromEnvironment(
    'TMDB_ACCESS_TOKEN',
  );

  final Dio _dio;
  final String accessToken;

  TmdbApi({Dio? dio, this.accessToken = _accessToken})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://api.themoviedb.org/3',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

  Future<MovieDetails> getMovieDetails({int movieId = 40096}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/movie/$movieId',
        queryParameters: {
          'language': 'pt-BR',
          'append_to_response': 'credits,release_dates',
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      final data = response.data;
      if (data == null) {
        throw const FormatException('A TMDB retornou uma resposta vazia.');
      }
      return MovieDetails.fromJson(data);
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;
      if (statusCode == 401) {
        throw Exception('Token da TMDB inválido ou não autorizado.');
      }
      if (statusCode == 404) {
        throw Exception('Filme não encontrado na TMDB.');
      }
      throw Exception(
        'Não foi possível consultar a TMDB. Verifique sua conexão.',
      );
    }
  }

  static String? imageUrl(String? path, {String size = 'w780'}) {
    if (path == null || path.isEmpty) return null;
    return 'https://image.tmdb.org/t/p/$size$path';
  }
}
