class RecomendacaoHome {
  final int id;
  final String titulo;
  final String imagem;
  final String descricao;

  const RecomendacaoHome({
    required this.id,
    required this.titulo,
    required this.imagem,
    required this.descricao,
  });

  factory RecomendacaoHome.fromJson(Map<String, dynamic> json) {
    return RecomendacaoHome(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      imagem: json['imagem'] as String? ?? '',
      descricao: json['descricao'] as String? ?? '',
    );
  }
}
