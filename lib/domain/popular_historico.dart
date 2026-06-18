class Popular {
  late String titulo;

  Popular ({
    required this.titulo
  });

  Popular.fromJson(Map<String, dynamic> json){
    titulo = json['titulo'];
  }
}

class Historico {
  late String termo;

  Historico ({
    required this.termo
  });

  Historico.fromJson(Map<String, dynamic> json){
    termo = json['termo'];
  }
}