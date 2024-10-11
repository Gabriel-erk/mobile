import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // "_" representa que o atributo é privado é só vai ser utilizado nessa classe
  int _contador = 0;

  // método só vai ser utilizado nessa classe
  void _incrementar() {
    // faz com que seja atualizado em tempo real quando a váriavel muda (setState)
    setState(() {
      if (_contador < 30) {
        _contador++;
      }
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // celulares tem cameras diferentes, que ocupam espaços diferentes (como o motorola e o iphone), e o scaffold ajusta o app para se adaptar a este limite da camera
    // passando os valores para os construtores do Scaffold pelo (parâmetros)
    return Scaffold(
      appBar: AppBar(
        // mostra o texto contador na navbar
        title: const Text("Contador"),
        backgroundColor: const Color(0xFFff0000),
        foregroundColor: const Color(0xFFffffff),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // linha da forma vertical ao centro - centralizando na vertical o meu elemento
          mainAxisAlignment: MainAxisAlignment.center,
          // children diz q é um array de widgets
          children: [
            const Text("Pressione o botão",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            Text(
              "$_contador",
              style: const TextStyle(fontSize: 40, color: Colors.blue),
            ),
          ],
        ),
      ),
      // criando uma linha - adicionando elementos na horizontal
      floatingActionButton: Row(
        // centralizando na horizontal
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // dizendo que dentro do array children vai ter o botão de '+' e '-'
        children: [
          FloatingActionButton(
              // conteúdo dentro do botão
              onPressed: () {
                _incrementar();
              },
              child: const Icon(Icons.add)),
          FloatingActionButton(
            // on pressed já espera uma função, então pode chamar assim direto
            onPressed: _decrementar,
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
