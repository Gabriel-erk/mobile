import 'package:app_bookmenow/home_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  // run app roda o aplicativo (que esta no arquivo home_page) e materialapp carrega ele
  runApp(MaterialApp(
    // nome do app
    title: "BookMeNow",
    // desativar mini banner do canto superior direito
    debugShowCheckedModeBanner: false,
    // definindo o tema do app (com a cor primária em branco)
    theme: ThemeData(primaryColor: Colors.white),
    // chamando minha classe que irá conter todo o corpo do meu app (HomePage)
    home: const HomePage(),
  ));
}
