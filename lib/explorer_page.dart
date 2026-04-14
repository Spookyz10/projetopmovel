import 'package:flutter/material.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: SizedBox(
          height: 42,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Where are you going?',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          buildContainer(
            urlImage:
                'https://www.envoyage.com/sites/default/files/styles/full_size/public/Dest_Netherlands_Landing.jpg?itok=AXtp56Mm',
            local: 'Harlingen, Netherlands',
            dates: '18 - 23 Dec',
            host: 'Professional Host',
            total: '\$1,068 total',
          ),
          buildContainer(
            urlImage:
                'https://blog.theifriend.com/wp-content/uploads/2021/11/guia-de-viagem-maragogi-al-piscinas-naturais-990x556.png',
            local: 'Maragogi, Brazil',
            host: 'Professional Host',
            dates: '10 Jan - 31 Dec',
            total: '\$5,200 total',
          ),
        ],
      ),
    );
  }

  buildContainer({
    required String urlImage,
    required String local,
    required String host,
    required String dates,
    required String total,
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(urlImage, height: 300, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                child: Icon(Icons.favorite, size: 36, color: Colors.pinkAccent),
                top: 16,
                right: 16,
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), //TextStyle(),
              ),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(host),
          buildText(dates),
          buildText(total),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(text, style: TextStyle());
  }
}