import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificacoes = false;
  bool temaEscuro = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080C15),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Color.fromRGBO(28, 41, 66, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          height: 42,
          child: Text(
            'Configurações!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
                  value: notificacoes,
                  onChanged: (val) {
                    setState(() {
                      notificacoes = val;
                    });
                  },
                ),

                Divider(
                  color: Color(0xFF344973),
                  thickness: 1,
                  indent: 6,
                  endIndent: 6,
                ),

                buildContainer(
                  SettingName: 'Tema Escuro',
                  Description:
                      'Ativa o modo escuro para uma experiência mais confortável à noite.',
                  value: temaEscuro,
                  onChanged: (val) {
                    setState(() {
                      temaEscuro = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildContainer({
    required String SettingName,
    required String Description,
    required bool value,
    required Function(bool) onChanged,
  }) {
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
                  value: value,
                  onChanged: onChanged,
                  activeThumbColor: Color(0xFF1F85FF),
                  inactiveThumbColor: Color(0xFF88898D),
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
}
