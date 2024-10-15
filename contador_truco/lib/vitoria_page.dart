import 'package:flutter/material.dart';

class VitoriaPage extends StatelessWidget {
  const VitoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitória'),
        backgroundColor: const Color(0xff7d687d),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Clicou no botão voltar"),
                backgroundColor: Colors.red,
              ));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Parabéns",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7d687d)),
              ),
              Text(
                "Vitória do grupo Eles",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900]),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/trofeu.png',
                width: 300,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7d687d),
                  shape: const BeveledRectangleBorder(),
                  minimumSize: const Size(230, 55),
                ),
                child: const Text(
                  'Nova partida',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
