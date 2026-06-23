class AssistirMaisTarde {
  late String titulo;
  late String urlimage;

  AssistirMaisTarde({required this.titulo, this.urlimage = ''});

  AssistirMaisTarde.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    urlimage = json['urlimage'] ?? '';
  }
}
