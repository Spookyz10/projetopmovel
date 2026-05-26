import 'package:flutter/material.dart';

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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0614),
      body: SingleChildScrollView(
        child: Column(
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
                            border: Border.all(color: Color(0xFF5B21B6)),
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
                              onPressed: () {},
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
                              "Feedback",
                              style: TextStyle(
                                color: Color.fromARGB(255, 244, 219, 54),
                              ),
                            ),
                            icon: Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 244, 219, 54),
                              size: 20,
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                186,
                                255,
                                179,
                                0,
                              ).withValues(alpha: 0.3),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                187,
                                255,
                                0,
                                0,
                              ).withValues(alpha: 0.3),
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
      )
    );
  }

  buildItem({
    required IconData icon,
    required String SettingName,
    required String Description,
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
                value: false,
                activeThumbColor: Color(0xFF8B5CF6),
                inactiveThumbColor: Color.fromARGB(255, 47, 47, 47),
                onChanged: null,
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
