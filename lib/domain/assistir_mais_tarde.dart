class AssistirMaisTarde {
  late String titulo;

  AssistirMaisTarde({required this.titulo});

  AssistirMaisTarde.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
  }
}
