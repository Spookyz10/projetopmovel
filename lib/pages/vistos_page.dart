import 'package:flutter/material.dart';
import 'package:project_c/db/fake_database.dart';
import 'package:project_c/widget/container_propriedade.dart';

class VistosPage extends StatefulWidget {
  const VistosPage({super.key});

  @override
  State<VistosPage> createState() => _VistosPageState();
}

backgroundColor: Colors.black,

/*fundo preto*/
appBar: AppBar(
/*barra superior*/
backgroundColor: Colors.black,
title: Text("Vistos", style: TextStyle(color: Colors.white)),
), required body,
),

class _VistosPageState extends State<VistosPage> {

    @override
    widget build(BuildContext context){
      return Scaffold(
        body: ListView.builder(
          itemCount: FakeDatabase.listaPropriedade.length,
          itemBuilder: (context, i) {
            return ContainerPropriedade(propriedade: FakeDatabase.listaPropriedade[i]);
        )
      )
      }
    }


    return Scaffold(
      /*estrutura básica da tela*/
      backgroundColor: Colors.black,

      /*fundo preto*/
      appBar: AppBar(
        /*barra superior*/
        backgroundColor: Colors.black,
        title: Text("Vistos", style: TextStyle(color: Colors.white)),
      ), required body,
      ),
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
