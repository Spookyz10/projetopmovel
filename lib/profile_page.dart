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
      backgroundColor: Color(0xFF030D19),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, bottom: 30),
            decoration: BoxDecoration(color: Color(0xFF1C202C)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 50, 50, 50),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(width: 30),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.create, color: Colors.white),
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
                              SizedBox(width: 10),
                              Text(
                                "Editar Username",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          content: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: "Digite seu username",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Color(0xFF030D19),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.white, width: 2),
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
                              child: Text("Salvar", style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                buildItem(
                  icon: Icons.settings,
                  text: 'Configurações',
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SettingsPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },
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
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }
}
