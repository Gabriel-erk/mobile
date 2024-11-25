import 'package:flutter/material.dart';

// stateful pois irá sofrer alterações
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> servicos = [
    {
      "titulo": "Corte de cabelo",
      "descricao":
          "a descrica desse texto foi um teste para ver se da certo o terreno para o json",
      "preco": 50.00,
      "imagem": "https://via.placehodler.com/150"
    },
    {
      "titulo": "Mecanico",
      "descricao": "um teste para ver se da certo o terreno para o json",
      "preco": 120.00,
      "imagem": "https://via.placehodler.com/150"
    },
    {
      "titulo": "Corte de cabelo",
      "descricao":
          "a descrica desse texto foi um teste para ver se da certo o terreno para o json",
      "preco": 50.00,
      "imagem": "https://via.placehodler.com/150"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMeNow"),
        centerTitle: true,
        // definindo cor de fundo da appBar (basicamente a navbar daqui)
        backgroundColor: Colors.white,
      ),
      // definindo cor de fundo do resto do app (basicamente o body daqui - tudo no corpo da tela está no escopo do scaffold)
      backgroundColor: Colors.white,
      // coloca as três barrinhas no canto superior esquerdo, permitindo um menu lateral (basicamente um menu lateral)
      drawer: Drawer(
        // child é um elemento filho de drawer
        // ListVIew é basicamente uma lista ul do html
        child: ListView(
          // elementos filhos da nossa lista
          children: const [
            // drawerHeader é basicamente o cabeçalho do menu lateral, o que aparecerá no topo
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.orange),
                  padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  child: Text(
                    "Olá, Gabriel Lindão",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ),
            // listTitle para tópico de lista
            ListTile(
              // leading posiciona do lado esquerdo, e está posicionado um icone no lado esquerdo
              leading: Icon(Icons.login),
              // este posiciona no lado direito
              // trailing: Icon(Icons.login),
              title: Text("Login"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Serviços"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Dúvidas"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre o BookMeNow"),
            ),
          ],
        ),
      ),
      // itemCount é para dizer a quantidade que queremos listar (no caso, tem que ser dinâmico, ent, o tamanho do meu objeto declarado lá em cima)
      // context é tudo o que tem na página, index é o indíce (como em um array), como tem 4 items no meu itemCount, ele irá repetir o itemBuilder 4 vezes
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          // Cada serviço será armazenado na variável servico enquanto servicos é percorrido
          final servico = servicos[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: const Color(0xFFfcfcfc),
            // criando uma linha, pois vou querer elementos um ao lado do outro, e ela faz isso (coluna deixa um abaixo do outro)
            child: Row(
              children: [
                // vai ter uma imagem da internet, pois o campo 'imagemUrl' do meu objeto servicos, contém um link da internet que manda para uma imagem
                Image.network(
                  servico['imagemUrl'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover, // vai ajustar a imagem ao centro do espaço em que ela está
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
