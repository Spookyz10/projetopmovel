import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Usuario";
  bool notificacoes = false;
  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    loadUsername();
    loadScreen();
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

  void saveScreen(bool newState) async {
    final info = await SharedPreferences.getInstance();
    await info.setBool('fullScreen', newState);
    setState(() {
      fullScreen = newState;
    });
  }

  void loadScreen() async {
    final info = await SharedPreferences.getInstance();
    final state = info.getBool('fullScreen') ?? false;
    
    setState(() {
      fullScreen = state;
    });

    if (state) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
    else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0614),
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
                            color: Color(0xFF5B21B6),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(100, 49, 15, 85),
                              Color.fromARGB(255, 31, 13, 54),
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
                                color: Color.fromARGB(15, 139, 92, 246),
                                border: Border.all(
                                  color: Color(0xFF5B21B6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  buildItem(
                                    icon: Icons.settings,
                                    SettingName: 'Full Screen',
                                    Description:
                                        'Esconde os botões de navegação e a barra de status',
                                    value: fullScreen,
                                    onChanged: (val) {
                                      saveScreen(val);
                                      if (val) {
                                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                      }
                                      else {
                                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                                      }
                                    },
                                  ),

                                  Divider(
                                    color: Color(0xFF7C3AED),
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

                      SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        height: 90,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton.icon(
                          label: Text(
                            "Avaliações",
                            style: TextStyle(color: Color.fromARGB(255, 244, 219, 54)),
                          ),
                          icon: Icon(Icons.star, color: Color.fromARGB(255, 244, 219, 54), size: 20),
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(186, 255, 179, 0).withValues(alpha: 0.3),
                            side: BorderSide(
                              color: Color.fromARGB(255, 255, 190, 59),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

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
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(187, 255, 0, 0).withValues(alpha: 0.3),
                            side: BorderSide(
                              color: Color.fromARGB(51, 255, 0, 0),
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
                activeThumbColor: Color(0xFF8B5CF6),
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
