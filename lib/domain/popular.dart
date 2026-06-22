class Popular {
  late String titulo;

  Popular ({
    required this.titulo
  });

  Popular.fromJson(Map<String, dynamic> json){
    titulo = json['titulo'];
  }
}