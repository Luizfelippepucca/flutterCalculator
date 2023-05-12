import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  String value = '0';
  String operation = '';
  double firstValue = 0.0;
  String countDescription = '';
  String equal = '';

  void handleGetvalue(String valueBtn) {
    switch (valueBtn) {
      case 'AC':
        setState(() {
          value = '0';
          countDescription = "";
          equal = "";
        });
        break;
    }

    void somar(double resultado) {
      resultado = firstValue + double.parse(value);
      List<String> resultadoList = resultado.toString().split('.');
      countDescription = '$firstValue+ ${double.parse(value)}';
      if (int.parse(resultadoList[1]) * 1 == 0) {
        setState(() {
          value = resultadoList[0];
        });
        return;
      }
      setState(() {
        if (resultadoList[1].length > 1) {
          value = resultado.toStringAsFixed(1);
          return;
        }
        value = resultado.toString();
      });
    }

    void subtrair(double resultado) {
      resultado = firstValue - double.parse(value);
      List<String> resultadoList = resultado.toString().split('.');
      countDescription = '$firstValue - ${double.parse(value)}';

      if (int.parse(resultadoList[1]) * 1 == 0) {
        setState(() {
          value = resultadoList[0];
        });
        return;
      }
      setState(() {
        if (resultadoList[1].length > 1) {
          value = resultado.toStringAsFixed(1);
          return;
        }
        value = resultado.toString();
      });
    }

    void multiplicar(double resultado) {
      resultado = firstValue * double.parse(value);
      List<String> resultadoList = resultado.toString().split('.');
      countDescription = '$firstValue * ${double.parse(value)}';

      if (int.parse(resultadoList[1]) * 1 == 0) {
        setState(() {
          value = resultadoList[0];
        });
        return;
      }
      setState(() {
        if (resultadoList[1].length > 1) {
          value = resultado.toStringAsFixed(1);
          return;
        }
        value = resultado.toString();
      });
    }

    void divisao(double resultado) {
      resultado = firstValue / double.parse(value);
      List<String> resultadoList = resultado.toString().split('.');
      countDescription = '$firstValue / ${double.parse(value)}';

      if (int.parse(resultadoList[1]) * 1 == 0) {
        setState(() {
          value = resultadoList[0];
        });
        return;
      }
      setState(() {
        if (resultadoList[1].length > 1) {
          value = resultado.toStringAsFixed(1);
          return;
        }
        value = resultado.toString();
      });
    }

    switch (valueBtn) {
      case '<x':
        setState(() {
          if (value.length > 1) {
            value = value.substring(0, value.length - 1);
            return;
          }
          value = '0';
        });
        break;
    }

    if (value.length <= 7) {
      switch (valueBtn) {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '.':
          setState(() {
            value += valueBtn;
            countDescription += valueBtn;
            if (value.contains('.')) {
              return;
            }
            int valueInt = int.parse(value);

            value = valueInt.toString();
          });
          break;
        case '+':
          firstValue = double.parse(value);
          value = '0';
          operation = '+';
          countDescription += operation;
          equal = '';
          break;
        case '-':
          firstValue = double.parse(value);
          value = '0';
          operation = '-';
          countDescription += operation;
          break;
        case '*':
          firstValue = double.parse(value);
          value = '0';
          operation = '*';
          countDescription += operation;
          break;
        case '/':
          firstValue = double.parse(value);
          value = '0';
          operation = '/';
          countDescription += operation;
          break;
        case ('='):
          double resultado = 0.0;

          if (operation == '+') {
            somar(resultado);
            equal = '=';
          }

          if (operation == '-') {
            subtrair(resultado);
            equal = '=';
          }
          if (operation == '*') {
            multiplicar(resultado);
            equal = '=';
          }

          if (operation == "/") {
            divisao(resultado);
            equal = '=';
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Calculadora'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 140,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$countDescription $equal',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          value,
                          style: const TextStyle(fontSize: 70),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => handleGetvalue('AC'),
                    child: const Text(
                      'AC',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleGetvalue('<x'),
                    child: Container(
                      width: 70,
                      child: Image.asset(
                          fit: BoxFit.cover, 'assets/images/excluir.png'),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => handleGetvalue('7'),
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('8'),
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('9'),
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('/'),
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => handleGetvalue('4'),
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('5'),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('6'),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('*'),
                  child: const Text(
                    'X',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => handleGetvalue('1'),
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('2'),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('3'),
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('-'),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => handleGetvalue('0'),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('.'),
                  child: const Text(
                    ',',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('='),
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleGetvalue('+'),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
