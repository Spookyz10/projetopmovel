import 'package:flutter/material.dart';
import 'package:project_c/domain/propriedade.dart';

class ContainerPerfil extends StatelessWidget {
  final Propriedade propriedade;

  const ContainerPerfil({super.key, required this.propriedade});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(15, 139, 92, 246),
        border: Border.all(color: Color(0xFF5B21B6), width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              propriedade.urlImage,
              width: 60,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  propriedade.filme,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '${propriedade.ano} • ${propriedade.genero}',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                SizedBox(height: 8),
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star,
                      size: 16,
                      color: i < propriedade.nota
                          ? Color(0xFF8B5CF6)
                          : Colors.white24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.favorite, color: Color(0xFF8B5CF6), size: 20),
        ],
      ),
    );
  }
}
