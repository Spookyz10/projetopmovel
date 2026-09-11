class Historico {
  final String termo;
  final int id;

  Historico({
    required this.termo,
    required this.id
  });

  factory Historico.fromJson(Map<String, dynamic> json) {
    return Historico(
      id: json['id'],
      termo: json['termo'] ?? '',
    );
  }
}
