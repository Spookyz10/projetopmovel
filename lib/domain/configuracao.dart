class Configuracao {
  late String chave;
  late bool valor;

  Configuracao({required this.chave, required this.valor});

  Configuracao.fromJson(Map<String, dynamic> json) {
    chave = json['chave'];
    valor = json['valor'] == 1;
  }
}
