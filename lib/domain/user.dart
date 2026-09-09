//KET
class User {
  late String username;
  late String password;

  User(this.username, this.password);

  User.fromJson(Map json) {
    // {  ["username": "valor", "password": "valor"], [], []   }
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["password"] = password;

    return json;
  }
}