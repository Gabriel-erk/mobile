import 'package:contador/home.dart';
// arquivos de icones ui - possui todos os componentes que irei usar
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

// chamando um aplicativo pelo Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // retornando os componentes que irei usar
    return MaterialApp(
      // texto q aparece na hr de baixar o app - o titulo dele
      title: 'Contador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}
