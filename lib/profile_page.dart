import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Usuario";
  bool notificacoes = false;
  bool temaEscuro = true;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    final info = await SharedPreferences.getInstance();
    setState(() {
      username = info.getString('username') ?? "Usuario";
    });
  }

  void saveUsername(String newName) async {
    final info = await SharedPreferences.getInstance();
    await info.setString('username', newName);

    setState(() {
      username = newName;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Perfil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 42, 42, 46),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(100, 20, 20, 26),
                              Color.fromARGB(255, 28, 28, 34),
                            ],
                            stops: [0.0, 0.6, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            username,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),

                          IconButton(
                            icon: Icon(Icons.create),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  TextEditingController controller =
                                      TextEditingController();
                                  return AlertDialog(
                                    backgroundColor: Color(0xFF1C202C),
                                    title: Row(
                                      children: [
                                        Icon(Icons.edit, color: Colors.white),
                                        SizedBox(width: 6),
                                        Text(
                                          "Editar Username",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),

                                    content: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: controller,
                                      decoration: InputDecoration(
                                        hintText: "Digite seu novo username",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                              255,
                                              123,
                                              123,
                                              255,
                                            ),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (controller.text.isNotEmpty) {
                                            saveUsername(controller.text);
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Salvar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancelar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Preferências",
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(15, 255, 255, 255),
                                border: Border.all(
                                  color: Color.fromARGB(255, 42, 42, 46),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  buildItem(
                                    icon: Icons.settings,
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

                                  Divider(
                                    color: Color.fromARGB(255, 90, 90, 90),
                                    indent: 20,
                                    endIndent: 20,
                                    thickness: 3,
                                  ),

                                  buildItem(
                                    icon: Icons.notifications,
                                    SettingName: 'Notificações',
                                    Description: 'Ativa as notificações.',
                                    value: notificacoes,
                                    onChanged: (val) {
                                      setState(() {
                                        notificacoes = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton.icon(
                          label: Text(
                            "Sair",
                            style: TextStyle(color: Colors.red),
                          ),
                          icon: Icon(Icons.exit_to_app, color: Colors.red),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                              15,
                              224,
                              74,
                              74,
                            ).withValues(alpha: 0.3),
                            side: BorderSide(
                              color: Color.fromARGB(51, 224, 74, 74),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildItem({
    required IconData icon,
    required String SettingName,
    required String Description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),

              SizedBox(width: 10),

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
                activeThumbColor: Color.fromARGB(255, 251, 193, 2),
                inactiveThumbColor: Color.fromARGB(255, 47, 47, 47),
              ),
            ],
          ),

          SizedBox(height: 6),

          Text(
            Description,
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
