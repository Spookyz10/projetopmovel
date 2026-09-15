import 'package:dio/dio.dart';
import 'package:project_c/domain/recomendacao_home.dart';

class FakeApiHome {
  static const defaultBaseUrl =
      'https://my-json-server.typicode.com/brunoocesar/fake_api_bruno';
  static const _configuredBaseUrl = String.fromEnvironment(
    'HOME_FAKE_API_BASE_URL',
    defaultValue: defaultBaseUrl,
  );

  final String _baseUrl = _configuredBaseUrl.replaceFirst(RegExp(r'/+$'), '');
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<RecomendacaoHome>> listarRecomendacoes() async {
    try {
      final response = await _dio.get<List<dynamic>>('$_baseUrl/recomendacoes');
      final data = response.data;
      if (data == null) throw const FormatException('Resposta vazia.');
      return data
          .map(
            (item) => RecomendacaoHome.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } on DioException {
      throw Exception(
        'Não foi possível carregar as escolhas da semana. Tente novamente.',
      );
    } on FormatException {
      throw Exception('As recomendações chegaram em um formato inesperado.');
    } on TypeError {
      throw Exception('As recomendações chegaram em um formato inesperado.');
    }
  }
}
