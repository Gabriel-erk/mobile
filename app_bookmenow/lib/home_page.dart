import 'package:flutter/material.dart';

// stateful pois irá sofrer alterações
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    );
  }
}
