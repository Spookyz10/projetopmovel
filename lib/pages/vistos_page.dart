import 'package:flutter/material.dart';
import 'package:project_c/db/propriedade_dao.dart';
import 'package:project_c/domain/propriedade.dart';

class VistosPage extends StatefulWidget {
  const VistosPage({super.key});

  @override
  State<VistosPage> createState() => _VistosPageState();
}

class _VistosPageState extends State<VistosPage> {
  List<Propriedade> listaPropriedades = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaPropriedades = await PropriedadeDao().listarPropriedades();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Vistos", style: TextStyle(color: Colors.white)),
      ),

      body: ListView.builder(
        itemCount: listaPropriedades.length,

        itemBuilder: (context, index) {
          Propriedade p = listaPropriedades[index];

          return filmeItem(p.urlImage, p.filme, p.ano, p.genero, p.nota);
        },
      ),
    );
  }

  Widget filmeItem(
    String imagem,
    String filme,
    String ano,
    String genero,
    double estrelas,
  ) {
    return Container(
      margin: const EdgeInsets.all(20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.asset(imagem, height: 150, width: 70, fit: BoxFit.cover),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                filme,
                style: const TextStyle(color: Colors.deepPurple, fontSize: 25),
              ),

              const SizedBox(height: 20),

              Text(
                '$ano • $genero',
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              ),

              const SizedBox(height: 20),

              Row(
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
