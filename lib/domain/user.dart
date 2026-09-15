//KET
// Serve para traduzir os dados que vem da api e estao em texto comum
// para a linguagem que dart entenda
class User {
  late String username;
  late String password;

  //construtor padrao, cria os dois carinhas
  User(this.username, this.password);

  User.fromJson(Map json) {
    username = json["username"];
    password = json["password"];
  }

  //contrario, caso eu precise atualizar,
  //criar ou fazer algo que nescessite enviar para a api
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["password"] = password;

    return json;
  }
}