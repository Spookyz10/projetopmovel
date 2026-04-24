import 'package:flutter/material.dart'; /*biblioteca principal do Flutter para construção de interfaces*/

class VistosPage extends StatefulWidget { /*cria a classe*/
  const VistosPage({super.key}); /*para o Flutter gerenciar melhor os widgets*/

  @override /*salva o estado do widget*/
  State<VistosPage> createState() => _VistosPageState();
}

class _VistosPageState extends State<VistosPage> {
  @override
  Widget build(BuildContext context) { /*constrói a interface do widget*/
    return Scaffold( /*estrutura básica da tela*/
      backgroundColor: Colors.black, /*fundo preto*/

      appBar: AppBar( /*barra superior*/
        backgroundColor: Colors.black,
        title: Text("Vistos", style: TextStyle(color: Colors.white),),
      ),

      body: ListView( /*lista de filmes que rola a tela*/
        children: [ /*filmeItem é uma função que monta o card do filme, evitando repetição*/
          filmeItem('assets/ogentesecreto.jpg', 'O Agente Secreto', '2023 • Suspense', 3),
          filmeItem('assets/cabra-marcado-para-morrer.jpg', 'Cabra Marcado para Morrer', '1984 • Documentário / Drama', 4),
          filmeItem('assets/terra-em-transe.jpg','Terra em Transe' , '1967 • Drama / Romance', 3),
          filmeItem('assets/o-bandido-da-luz-vermelha.jpg', 'O Bandido da Luz Vermelha', '1968 • Drama / Policial', 4),
          filmeItem('assets/são-paulo-e-a-sociedade-anonima.jpg', 'São Paulo e a Sociedade Anônima', '1965 • Drama / Romance', 3),
          filmeItem('assets/cidade-de-deus.jpg', 'Cidade de Deus', '2002 • Drama / Crime', 4),
          filmeItem('assets/o-pagador-de-promessas.jpg', 'O Pagador de Promessas', '1962 • Drama', 5),
          filmeItem('assets/macunaima.jpg', 'Macunaíma', '1969 • Comédia / Fantasia / Aventura', 5),
        ],
      ),
    );
  }

  Widget filmeItem(String imagem, String nome, String info, int estrelas) { /*recebe os dados do filme*/
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset( /*imagem do poster*/
            imagem,
            height: 150,
            width: 70,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 20), /*espaço entre a imagem e o texto*/

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text( /*título do filme*/
                nome,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                ),
              ),

              SizedBox(height: 20),

              Text( /*ano e gênero*/
                info,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 20),

              Row( /*estrelas de avaliação*/
                children: List.generate(5, (i) => Icon(
                  Icons.star,
                  color: i < estrelas ? Colors.deepPurple : Colors.grey,
                  size: 20,
                )),
              ),

            ],
          ),
        ],
      ),
    );
  }
}