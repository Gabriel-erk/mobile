import 'package:flutter/material.dart';

class DetalhesServicosPage extends StatelessWidget {
  // é um mapa pois recebe uma lista de serviços, uma lista de dados (array)
  final Map<String, dynamic> servico;
  // passando servico como uma váriavel essencial, vai jogar um erro se não tiver nenhum valor nessa váriavel
  const DetalhesServicosPage({super.key, required this.servico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(servico['titulo']),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
            // chave fotos array 1 (primeira posição) na chave imagem
            servico['fotos'][0]['imagem'],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            servico['titulo'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            servico['descricao'],
          ),
          Text(
            'R\$ ${double.parse(servico['valor']).toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
          Divider(),
          Text('Endereço: ${servico['rua']}'),
          Text("Bairro: ${servico['bairro']}"),
          Text("CEP: ${servico['cep']}"),
          Text("Telefone: ${servico['telefone']}"),
          Text("Celular: ${servico['celular']}"),
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
