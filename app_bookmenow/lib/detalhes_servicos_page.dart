import 'package:flutter/material.dart';

class DetalhesServicosPage extends StatelessWidget {
  const DetalhesServicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nome Serviço"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            "assets/trabalhador.avif",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Titulo do Serviço",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Descrição do Serviço"),
          const Text(
            "R\$ 20,00",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
          Divider(),
          const Text("Endereço: Rua Maria da Silva"),
          const Text("Bairro: Jardim Dos Palmares"),
          const Text("CEP: 98313-9087"),
          const Text("Telefone: 12345-8097"),
          const Text("Celular: 12345-8097"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ElevatedButton.icon para permitir que tenha um botão com um icone ao lado, pedindo 3 parâmetros, o que ele irá fazer (onPressed), o icone (icon) e o Texto (label)
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.phone),
                label: const Text(
                  "Ligar",
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.waving_hand),
                label: const Text(
                  "WhatsApp",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
