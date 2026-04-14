import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080C15),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Color(0xFF1C2942),
        title: SizedBox(
          height: 42,
          child: Text(
            'Perfil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Preferências',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.red,
                fontFamily: 'Arial',
              ),
            ),
          ),
           Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF1C2942),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF344973), width: 5),
            ),
            child: Column(
              children: [
                buildContainer(
                  SettingName: 'Notificações',
                  Description: 'Ativa as noti bro.',
                ),
                
                Divider(
                  color: Color(0xFF344973),
                  thickness: 1,
                  indent: 6,
                  endIndent: 6,
                ),
                
                buildContainer(
                  SettingName: 'Tema Escuro',
                  Description: 'Ativa o modo escuro para uma experiência mais confortável à noite.',
                ),
              ]
            )
          ),
        ],
      ),
    );
  }

  buildContainer({required String SettingName, required String Description}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    SettingName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: null,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              Description,
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(text, style: TextStyle());
  }
}
