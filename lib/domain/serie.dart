class Serie {
  final int id;
  final String titulo;
  final String? imagem;
  final double? nota;

  const Serie({required this.id, required this.titulo, this.imagem, this.nota});

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      id: json['id'] as int,
      titulo: json['name'] as String,
      imagem: (json['image'] as Map<String, dynamic>?)?['medium'] as String?,
      nota: ((json['rating'] as Map<String, dynamic>?)?['average'] as num?)
          ?.toDouble(),
    );
  }
}
