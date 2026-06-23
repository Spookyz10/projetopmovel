import 'package:flutter/material.dart';
import 'package:project_c/db/usuario_dao.dart';
import 'package:project_c/db/configuracao_dao.dart';

import 'package:project_c/domain/propriedade.dart';
import 'package:project_c/widget/container_perfil.dart';
import 'package:project_c/db/propriedade_dao.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Carregando...";
  bool fullScreen = false;
  bool notificacoes = false;
  List<Propriedade> _favoritos = [];

  final UsuarioDao _usuarioDao = UsuarioDao();
  final ConfiguracaoDao _configDao = ConfiguracaoDao();
  final PropriedadeDao _propriedadeDao = PropriedadeDao();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    String nome = await _usuarioDao.getUsername();
    bool fs = await _configDao.getValor('full_screen');
    bool notif = await _configDao.getValor('notificacoes');
    List<Propriedade> favoritos = await _propriedadeDao.listarFavoritos();
    setState(() {
      username = nome;
      fullScreen = fs;
      notificacoes = notif;
      _favoritos = favoritos;
    });
  }

  void _editarUsername() {
    TextEditingController editController = TextEditingController(
      text: username,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1A1026),
        title: Text("Editar nome", style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: editController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Novo username",
            hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B21B6)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar", style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () async {
              String novoNome = editController.text.trim();
              if (novoNome.isNotEmpty) {
                await _usuarioDao.salvarUsername(novoNome);
                setState(() {
                  username = novoNome;
                });
              }
              Navigator.pop(context);
            },
            child: Text("Salvar", style: TextStyle(color: Color(0xFF8B5CF6))),
          ),
        ],
      ),
    );
  }

  @override
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.create, color: Colors.white),
                              onPressed: _editarUsername,
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
                                      settingName: 'Full Screen',
                                      description:
                                          'Esconde os botões de navegação e a barra de status',
                                      value: fullScreen,
                                      onChanged: (val) async {
                                        await _configDao.salvarValor(
                                          'full_screen',
                                          val,
                                        );
                                        setState(() => fullScreen = val);
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
                                      settingName: 'Notificações',
                                      description: 'Ativa as notificações.',
                                      value: notificacoes,
                                      onChanged: (val) async {
                                        await _configDao.salvarValor(
                                          'notificacoes',
                                          val,
                                        );
                                        setState(() => notificacoes = val);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Favoritos",
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 12),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _favoritos.length,
                                itemBuilder: (context, index) {
                                  return ContainerPerfil(
                                    propriedade: _favoritos[index],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
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
      ),
    );
  }

  Widget buildItem({
    required IconData icon,
    required String settingName,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
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
                  settingName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Switch(
                value: value,
                activeThumbColor: Color(0xFF8B5CF6),
                inactiveThumbColor: Color.fromARGB(255, 47, 47, 47),
                onChanged: onChanged,
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
