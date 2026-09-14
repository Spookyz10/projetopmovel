import 'package:dio/dio.dart';
import 'package:project_c/domain/user_profile.dart';

class ProfileApi {
  static const String _configuredBaseUrl = String.fromEnvironment(
    'FAKE_API_BASE_URL',
  );
  static const String defaultBaseUrl =
      'https://my-json-server.typicode.com/Spookyz10/fake_api_alvaro';

  final Dio _dio;

  ProfileApi({Dio? dio, String? baseUrl})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl:
                  baseUrl ??
                  (_configuredBaseUrl.isEmpty
                      ? defaultBaseUrl
                      : _configuredBaseUrl),
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

  Future<UserProfile> getProfile({int profileId = 1}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/profiles/$profileId',
      );
      final data = response.data;
      if (data == null) {
        throw const FormatException('A API fake retornou uma resposta vazia.');
      }
      return UserProfile.fromJson(data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        throw Exception('Perfil não encontrado na API fake.');
      }
      throw Exception(
        'Não foi possível carregar o perfil. Verifique a conexão e se o db.json já foi enviado ao GitHub.',
      );
    }
  }
}
