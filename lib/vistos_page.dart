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
          filmeItem('assets/AbrilDespedacado.png', 'Abril Despedaçado', '2001 • Drama', 4),
          filmeItem('assets/AHoraDaEstrela.png', 'A Hora da Estrela', '1985 • Drama', 5),
          filmeItem('assets/AMulherDeTodos.png', 'A Mulher de Todos', '1969 • Comédia / Drama', 3),
          filmeItem('assets/ByeByeBrasil.png', 'Bye Bye Brasil', '1979 • Drama / Aventura', 4),
          filmeItem('assets/CentralDoBrasil.png', 'Central do Brasil', '1998 • Drama', 5),
          filmeItem('assets/CidadeDeDeus.png', 'Cidade de Deus', '2002 • Drama / Crime', 5),
          filmeItem('assets/OAutoDaCompadecida.png', 'O Auto da Compadecida', '2000 • Comédia / Drama', 4),
          filmeItem('assets/OCangaceiro.png', 'O Cangaceiro', '1953 • Drama / Faroeste', 3),
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