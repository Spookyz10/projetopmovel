import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              child: Column(
                spacing: 8.5,
                children: [
                  Image.asset('assets/avengers.jpg', height: 250,fit: BoxFit.cover, width: 350,),
                  Text('Vingadores', style: TextStyle(color: Colors.white),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
