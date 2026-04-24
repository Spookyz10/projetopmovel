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
          filmeItem('assets/limite.jpg', 'Limite', '1931 • Drama / Experimental'),
          filmeItem('assets/deus-e-o-diabo-na-terra-do-sol.jpg', 'Deus e o diabo na terra do sol', '1964 • Drama / Faroeste / Aventura'),
          filmeItem('assets/vidas-secas.jpg', 'Vidas Secas', '1963 • Drama'),
          filmeItem('assets/ogentesecreto.jpg', 'O Agente Secreto', '2023 • Suspense'),
          filmeItem('assets/cabra-marcado-para-morrer.jpg', 'Cabra Marcado para Morrer', '1984 • Documentário / Drama'),
          filmeItem('assets/terra-em-transe.jpg','Terra em Transe' , '1967 • Drama / Romance'),
          filmeItem('assets/o-bandido-da-luz-vermelha.jpg', 'O Bandido da Luz Vermelha', '1968 • Drama / Policial'),
          filmeItem('assets/são-paulo-e-a-sociedade-anonima.jpg', 'São Paulo e a Sociedade Anônima', '1965 • Drama / Romance'),
          filmeItem('assets/cidade-de-deus.jpg', 'Cidade de Deus', '2002 • Drama / Crime'),
          filmeItem('assets/o-pagador-de-promessas.jpg', 'O Pagador de Promessas', '1962 • Drama'),
          filmeItem('assets/macunaima.jpg', 'Macunaíma', '1969 • Comédia / Fantasia / Aventura'),
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