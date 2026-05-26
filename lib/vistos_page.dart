import 'package:flutter/material.dart';
import 'domain/propriedade.dart';

class VistosPage extends StatefulWidget {
  const VistosPage({super.key});

  @override
  State<VistosPage> createState() => _VistosPageState();
}

class _VistosPageState extends State<VistosPage> {
  @override
  /*COMEÇA MEU CÓDIGO*/
  Widget build(BuildContext context) {
    /*constrói a interface do widget*/
    List listaPropriedades = [
      Propriedade(
        urlImage: 'assets/AbrilDespedacado.png',
        filme: 'Abril Despedaçado',
        ano: '2001',
        genero: 'Drama',
      ),
      Propriedade(
        urlImage: 'assets/AHoraDaEstrela.png',
        filme: 'A Hora da Estrela',
        ano: '1985',
        genero: 'Drama',
      ),
      Propriedade(
        /*MUDAR APARTIR DAQUIII*/
        urlImage: 'assets/AMulherDeTodos.png',
        filme: 'A Mulher de Todos',
        ano: '1969',
        genero: 'Comédia / Drama',
      ),
      Propriedade(
        urlImage: 'assets/AMulherDeTodos.png',
        filme: 'A Mulher de Todos',
        ano: '1969',
        genero: 'Comédia / Drama',
      ),
      Propriedade(
        urlImage: 'assets/AMulherDeTodos.png',
        filme: 'A Mulher de Todos',
        ano: '1969',
        genero: 'Comédia / Drama',
      ),
      Propriedade(
        urlImage: 'assets/AMulherDeTodos.png',
        filme: 'A Mulher de Todos',
        ano: '1969',
        genero: 'Comédia / Drama',
      ),
    ];

    return Scaffold(
      /*estrutura básica da tela*/
      backgroundColor: Colors.black,

      /*fundo preto*/
      appBar: AppBar(
        /*barra superior*/
        backgroundColor: Colors.black,
        title: Text("Vistos", style: TextStyle(color: Colors.white)),
      ),

      body: ListView(
        /*lista de filmes que rola a tela*/
        children: [
          /*filmeItem é uma função que monta o card do filme, evitando repetição*/
          filmeItem(
            'assets/AbrilDespedacado.png',
            'Abril Despedaçado',
            '2001 • Drama',
            4,
          ),
          filmeItem(
            'assets/AHoraDaEstrela.png',
            'A Hora da Estrela',
            '1985 • Drama',
            5,
          ),
          filmeItem(
            'assets/AMulherDeTodos.png',
            'A Mulher de Todos',
            '1969 • Comédia / Drama',
            3,
          ),
          filmeItem(
            'assets/ByeByeBrasil.png',
            'Bye Bye Brasil',
            '1979 • Drama / Aventura',
            4,
          ),
          filmeItem(
            'assets/CentralDoBrasil.png',
            'Central do Brasil',
            '1998 • Drama',
            5,
          ),
          filmeItem(
            'assets/CidadeDeDeus.png',
            'Cidade de Deus',
            '2002 • Drama / Crime',
            5,
          ),
          filmeItem(
            'assets/OAutoDaCompadecida.png',
            'O Auto da Compadecida',
            '2000 • Comédia / Drama',
            4,
          ),
          filmeItem(
            'assets/OCangaceiro.png',
            'O Cangaceiro',
            '1953 • Drama / Faroeste',
            3,
          ),
        ],
      ),
    );
  }

  Widget filmeItem(String imagem, String nome, String info, int estrelas) {
    /*recebe os dados do filme*/
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            /*imagem do poster*/
            imagem,
            height: 150,
            width: 70,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 20),

          /*espaço entre a imagem e o texto*/
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                /*título do filme*/
                nome,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25),
              ),

              SizedBox(height: 20),

              Text(
                /*ano e gênero*/
                info,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),

              SizedBox(height: 20),

              Row(
                /*estrelas de avaliação*/
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.star,
                    color: i < estrelas ? Colors.deepPurple : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
