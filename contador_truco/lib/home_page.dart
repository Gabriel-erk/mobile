import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _placarNos = 0;
  int _placarEles = 0;

  int _vitoriasNos = 0;
  int _vitoriasEles = 0;

  void aumentarPontos(String grupo, int qntdPontos) {
    if (grupo.toLowerCase() == "nos") {
      if (_placarNos < 12) {
        setState(() {
          _placarNos += qntdPontos;
        });
      } else {
        _placarNos = 0;
      }
    } else if (grupo.toLowerCase() == "eles") {
      if (_placarEles < 12) {
        setState(() {
          _placarEles += qntdPontos;
        });
      } else {
        _placarEles = 0;
      }
    }
  }

  void diminuirPontos(String grupo) {
    if (grupo.toLowerCase() == "nos") {
      if (_placarNos > 0) {
        setState(() {
          _placarNos -= 1;
        });
      }
    } else if (grupo.toLowerCase() == "eles") {
      setState(() {
        _placarEles -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Truco"),
        backgroundColor: const Color(0xff7d6b7d),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // permite barra de rolagem casso precise (no caso atual, permite no momento que giramos o celular)
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // Distribui o espaço entre as colunas
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Primeira coluna
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Nós',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7d6b7d),
                      ),
                    ),
                    // Container para a pontuação
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color(0xfffffddc),
                          border: Border.all(
                            color: const Color(0xff7d6b7d),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          _placarNos.toString(),
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe22364),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        diminuirPontos("nos"); // Chame sua função aqui
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xffe5e5e5),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff7d6b7d),
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          '-1',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      // onPressed é o evento  e child o que quero dentro (por enquanto o evento está nulo e o conteúdo é o texto +1)
                      onPressed: () {
                        aumentarPontos("nos", 1);
                      },
                      // definindo o estilo do botão
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7d6b7d),
                        minimumSize:
                            const Size(120, 60), // tamanho (largura, altura)
                        shape: RoundedRectangleBorder(
                          // alterando o shape (corpo/formato dele)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // dentro deste child vai o corpo do elevatedbutton, o que vai ter dentro dele
                      child: const Text("+1",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    // define um espaço em branco, com altura de 20 (bloco 2)
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        aumentarPontos("nos", 3);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7d6b7d),
                          minimumSize: const Size(120, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text("+3",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          aumentarPontos("nos", 6);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7d6b7d),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "+6",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ))
                  ],
                ),
                // Segunda coluna
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Eles',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7d6b7d),
                      ),
                    ),
                    Container(
                      // EdgeInsets.all(value) adiciona para as 4 bordas - only(top) diz q quero somente o margin top
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color(0xfffffddc),
                          border: Border.all(
                            color: const Color(0xff7d6b7d),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          _placarEles.toString(),
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe22364),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        diminuirPontos("eles"); // Chame sua função aqui
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xffe5e5e5),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff7d6b7d),
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          '-1',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      // onPressed é o evento  e child o que quero dentro (por enquanto o evento está nulo e o conteúdo é o texto +1)
                      onPressed: () {
                        aumentarPontos("eles", 1);
                      },
                      // definindo o estilo do botão
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7d6b7d),
                        minimumSize:
                            const Size(120, 60), // tamanho (largura, altura)
                        shape: RoundedRectangleBorder(
                          // alterando o shape (corpo/formato dele)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("+1",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    // define um espaço em branco, com altura de 20 (bloco 2)
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        aumentarPontos("eles", 3);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7d6b7d),
                          minimumSize: const Size(120, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text("+3",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          aumentarPontos("eles", 6);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7d6b7d),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "+6",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
            Padding(
              // adicionando padding, com symetric, onde o eixo y (vertical) vai ter 20 de padding e o eixo x (horizontal) vai ter 10
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Image.asset('assets/banner-cartas.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _vitoriasNos.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe22364)),
                ),
                Text(
                  'Vitórias',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7d687d)),
                ),
                Text(
                  _vitoriasEles.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe22364)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7d687d),
                        shape: BeveledRectangleBorder(),
                        minimumSize: const Size(130, 55),
                      ),
                      child: const Text(
                        'Nova partida',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Espaço entre os botões
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7d687d),
                        shape: BeveledRectangleBorder(),
                        minimumSize: const Size(130, 55),
                      ),
                      child: const Text(
                        'Zerar Jogo',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
