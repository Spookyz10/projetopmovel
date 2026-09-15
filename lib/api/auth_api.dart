//KET
// serve para fazer a autenticação dos dados, se esta ou n cadastrado
import 'dart:convert';
import 'package:http/http.dart' as http; //irá fazer uma chamada externa na rede, que é a nossa api
import '../domain/user.dart';

class AuthApi {
  // http conversa com a internet para pegar o arquivo
  final String _url = 'https://raw.githubusercontent.com/LK-K7/fake_api/main/users.json';

  // login recebe
  Future<User?> login(String username, String password) async {
    try {
      // o get acessa a url do git, onde ta o json, e baixa os dados
      final response = await http.get(Uri.parse(_url));

      // o Decode pega o texto puro do nosso git
      if (response.statusCode == 200) {
        List listJson = jsonDecode(response.body);

        // fromjson converte esse texto para uma lista
        List<User> users = listJson.map((json) => User.fromJson(json)).toList();

        // procura de os credenciais que pegamos do json, para ver se estar cadastradas
        for (var user in users) {
          if (user.username == username && user.password == password) {
            return user; // retorna o usuário encontrado
          }
        }
      }
    } catch (e) { // se caso as informações estiverem erradas ou se a internet falhar
      print('Erro, querida: $e');
    }

    return null;
  }
}