import 'package:flutter/material.dart';
import 'package:project_c/db/propriedade_dao.dart';
import 'package:project_c/domain/propriedade.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {

  List<Propriedade> listaFavoritos = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaFavoritos = await PropriedadeDao().listarPropriedades();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Favoritos",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        itemCount: listaFavoritos.length,

        itemBuilder: (context, index) {

          Propriedade p = listaFavoritos[index];

          return filmeItem(
            p.urlImage,
            p.filme,
            '${p.ano} • ${p.genero}',
          );
        },
      ),
    );
  }

  Widget filmeItem(String imagem, String nome, String info) {
    return Container(
      margin: const EdgeInsets.all(20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Image.asset(
            imagem,
            height: 150,
            width: 70,
            fit: BoxFit.cover,
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                nome,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                info,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),

              const Icon(
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