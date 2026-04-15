import 'package:flutter/material.dart';
import 'settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
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
                  'Usuario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
