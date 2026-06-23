import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'pages/home_page.dart';

void main() {
  // Garante que o Flutter inicialize antes do banco de dados
  WidgetsFlutterBinding.ensureInitialized();

  // Configura o banco de dados para rodar no Windows/Desktop
  databaseFactory = databaseFactoryFfi;

  runApp(MaterialApp(home: HomePage()));
}