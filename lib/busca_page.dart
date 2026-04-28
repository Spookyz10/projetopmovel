import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BuscaPage extends StatefulWidget {
 const BuscaPage({super.key});


 @override 
 State<BuscaPage> createState() => _BuscaPageState();
}
class _BuscaPageState extends State<BuscaPage>{
 TextEditingController controller = TextEditingController();
 List<String> history = [];
 final List<String> popular = [
   "Bacurau",
   "Carandiru",
   "Agente Secreto",
   "O Auto da Compadecida"
 ];


 @override
 void initState() {
   super.initState();
   loadHistory(); 
}
 void loadHistory() async {
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     history = prefs.getStringList('searchHistory') ?? []; 
 });
}


 void saveHistory(String termo) async { 
   final prefs = await SharedPreferences.getInstance();
   history.add(termo); 
   await prefs.setStringList('searchHistory', history);
   setState(() {}); 
 }
 @override
 Widget build(BuildContext context){ 
   return Scaffold(
     backgroundColor: const Color (0xFF0E0E10),


     appBar: AppBar (
       backgroundColor: const Color(0xFF0E0E10),


       title: TextField(
         controller: controller,
         style: const TextStyle(color: Colors.white),


         decoration: InputDecoration(
           hintText: "Buscar filmes...",
           hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
           border: InputBorder.none, 
         ),


         onSubmitted: (value) { 
           if (value.isNotEmpty){ 
             saveHistory(value);
             controller.clear();
           }
         },
       ),
     ),
     body: Padding(
       padding: const EdgeInsets.all(16),
       child: Column (
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
           // historico
           Text(
             "Histórico de Busca",
             style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
           ),
           const SizedBox(height: 10), 
           Wrap(
             spacing: 10,
             children: history.map((term) {
               return Chip(
                 label: Text(term),
                 backgroundColor: const Color(0xFF5B21B6),
                 labelStyle: const TextStyle(color: Colors.white),
               );
             }).toList(), 
           ),
           const SizedBox(height: 30),


           // mais pesquisados
           Text(
             "Mais pesquisados",
             style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
           ),
           const SizedBox(height: 10),
           Expanded(
               child: ListView(
                 children: popular.map((movie){
                   return ListTile(
                     leading: const Icon(Icons.movie, color: Color(0xFF7C3AED)),
                     title: Text(movie, style: const TextStyle(color: Colors.white)),
                   );
                 }).toList(),
               ),
           ),
         ],
       ),
     ),
   );
 }


}
