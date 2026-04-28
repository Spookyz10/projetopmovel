import 'package:flutter/material.dart'; /*biblioteca principal do Flutter para construção de interfaces*/

class FavoritosPage extends StatefulWidget { /*cria a classe*/
  const FavoritosPage({super.key}); /*para o Flutter gerenciar melhor os widgets*/

  @override /*salva o antes e ps d widgthe, que no caso aqui, ele marca e desmarca*/
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) { /* constroi a interface do widget*/
    return Scaffold( /*retorna o scaffold que é a estrutura basica da tela*/
      backgroundColor: Colors.black, /*define a cor da tela do fundo de preta*/

      appBar: AppBar( /*Configuração da barra superior (AppBar)*/
        backgroundColor: Colors.black,
        title: Text("Favoritos", style: TextStyle(color: Colors.white),),
      ),

      body: ListView( /*Corpo principal da tela*/
        children: [ /*filmeItem é uma função, que eu posso colocar a imagem, nome, etc, sem precisar fazer isso repetidamente*/
          filmeItem('assets/AbrilDespedacado.png', 'Abril Despedaçado', '2001 • Drama'),
          filmeItem('assets/AHoraDaEstrela.png', 'A Hora da Estrela', '1985 • Drama'),
          filmeItem('assets/AMulherDeTodos.png', 'A Mulher de Todos', '1969 • Comédia / Drama'),
          filmeItem('assets/ByeByeBrasil.png', 'Bye Bye Brasil', '1979 • Drama / Aventura'),
          filmeItem('assets/CentralDoBrasil.png', 'Central do Brasil', '1998 • Drama'),
          filmeItem('assets/CidadeDeDeus.png', 'Cidade de Deus', '2002 • Drama / Crime'),
          filmeItem('assets/OAutoDaCompadecida.png', 'O Auto da Compadecida', '2000 • Comédia / Drama'),
          filmeItem('assets/OCangaceiro.png', 'O Cangaceiro', '1953 • Drama / Faroeste'),
          filmeItem('assets/OInvasor.png', 'O Invasor', '2001 • Drama / Thriller'),
          filmeItem('assets/OLoboAtrasDaPorta.png', 'O Lobo Atrás da Porta', '2013 • Thriller'),
          filmeItem('assets/OPalhaco.png', 'O Palhaço', '2011 • Comédia / Drama'),
          filmeItem('assets/TropaDeElite.png', 'Tropa de Elite', '2007 • Drama / Ação'),
        ],
      ),
    );
  }

  Widget filmeItem(String imagem, String nome, String info) { /*ele ja traz um corpo pronto*/
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagem,
            height: 150,
            width: 70,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 20), /*espaçamento entre os children*/

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(  /*titulo*/
                nome,
                style: TextStyle(color: Colors.deepPurple,
                    fontSize: 25),
              ),

              SizedBox(height: 20),

              Text( /*ano e genero*/
                info,
                style: TextStyle(color: Colors.grey,
                fontSize: 20),

              ),

              SizedBox(height: 20),

              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}