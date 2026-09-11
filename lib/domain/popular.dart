class Popular {
  final String titulo;

  Popular ({
    required this.titulo
  });

  factory Popular.fromJson(Map<String, dynamic> json){
    return Popular(
      titulo: json['name'] ?? '',
    );
  }
}