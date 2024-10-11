import 'package:contador_truco/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Contador de Truco",
      debugShowCheckedModeBanner: false,
      // a tela será desenhada neste arquivo - o main apenas irá chama-lo
      home: HomePage(),
    )
  );
}

