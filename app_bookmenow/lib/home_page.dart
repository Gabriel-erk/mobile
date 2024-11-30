import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ele vai ser usado na hora de converter os dados para json
import 'dart:convert';

// stateful pois irá sofrer alterações
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lista vazia que vai receber os dados da minha api (depois irei pega-la e listar seu valores na tela)
  List<dynamic> servicos = [];
  // se receber os dados é igual a true, e vai mostrar a bolinha de carregando dados
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    listaServicos();
  }

  // future pq é asyncrona, e não quero carregar todas as informações de uma vez, pois o site não carregaria (pensar assim com o iffod, ele não pode carregar tudo de uma vez, pois não iria cattegar nunca, então é uma coisa de cada vez)
  Future<void> listaServicos() async {
    // se der erro na execução mostro msg de erro
    try {
      // await http.get...(é basicamente espere carregar o http.get)
      final response =
          await http.get(Uri.parse('http://10.56.45.27/public/api/servicos'));
      if (response.statusCode == 200) {
        setState(() {
          servicos = json.decode(response.body);
          // carregou os dados, a bolinha de carregar some
          isLoading = false;
        });
      }
    } catch (e) {
      // passando uma String de parâmetro (função pede um)
      mostrarError('Erro: $e');
    }
  }

  // mostra erro no catch caso dê errado
  void mostrarError(String mensagem) {
    setState(() {
      // se for mostrar um erro (ou seja, se foi entrar aqui, para de carregar)
      isLoading = false;
      // insere uma mensagem de erro no snackBar (mostra um alerta no rodape pro usuário)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagem)));
    });
  }

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
      // utilizando if ternario (condição ? verdadeiro : falso), então isLoading(condição - então, se ainda não carregou os dados, fica a bolinha girando) ?  : ListView.Builder...(falso, já carregou os dados, então vai carregar este comando) 
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                      // vai ter uma imagem da internet, pois o campo 'imagem' do meu objeto servicos, contém um link da internet que manda para uma imagem
                      Image.network(
                        // dentro da váriavel servico, campo fotos (que possui um array) entra na posição 0 do array(que está a minha foto, já que o serivico possui uma só) e entrando na chave imagem do do campo 0 do array
                        servico['fotos'][0]['imagem'],
                        width: 80,
                        height: 80,
                        fit: BoxFit
                            .cover, // vai ajustar a imagem ao centro do espaço em que ela está
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              servico['titulo'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            // parei aqui na criação do meu site
                            // limitando caracteres em 50
                            // Text('${servico['descricao'].substring(0, 50)}....'),
                            Text(
                              servico['descricao'],
                              // permite no maximo 2 linhas para o conteúdo deste text
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // barra invertida para permitir o $ sem que considere váriavel
                            // double.parse pois o campo valor dentro da váriavel servico é uma string, então tenho que converte-la para double e depois usar o método toStringAsFixed(2) para limitar casas decimais em 2
                            Text(
                                'R\$ ${double.parse(servico['valor']).toStringAsFixed(2)}')
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
            ),
    );
  }
}
