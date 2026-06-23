class Historico {
  late String termo;

  Historico({required this.termo});

  Historico.fromJson(Map<String, dynamic> json) {
    termo = json['termo'];
  }
}
