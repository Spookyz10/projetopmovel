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
        title: Text("Favoritos"),
      ),

      body: ListView( /*Corpo principal da tela*/
        children: [ /*filmeItem é uma função, que eu posso colocar a imagem, nome, etc, sem precisar fazer isso repetidamente*/
          filmeItem('assets/avengers.jpg', 'Vingadores', '2012 • Ação'),
          filmeItem('assets/interstellar.jpg', 'Interestelar', '2014 • Ficção'),
          filmeItem('assets/clubedaluta.jpg', 'Clube da Luta', '1999 • Drama'),
          filmeItem('assets/ogentesecreto.jpg', 'O Agente Secreto', '2023 • Suspense'),
          filmeItem('assets/homem-aranha2.jpg', 'Homem-Aranha 2', '2004 • Ficção Científica'),
          filmeItem('assets/f1filme.jpg','F1: O Filme' , 'Esporte/Ação')
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