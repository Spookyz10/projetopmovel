class Propriedade {
  //Você precisa usar late porque, no construtor fromJson, as variáveis
  // são preenchidas depois que o objeto começa a ser criado.
  late String urlImage;
  late String filme;
  late String ano;
  late String genero;
  late double nota; // avaliação
  late int favorito; //pagina

  Propriedade({
    required this.urlImage,
    required this.filme,
    required this.ano,
    required this.genero,
    required this.nota,
    required this.favorito,
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlimage'];
    filme = json['filme'];
    ano = json['ano'];
    genero = json['genero'];
    nota = json['nota'];
    favorito = json['favorito'];
  }
}
