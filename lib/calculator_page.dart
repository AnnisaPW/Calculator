import 'package:flutter/material.dart';

import 'my_container.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var valX = 0.0;
  var valOps = '';
  var valY = 0.0;
  var valScreen = '0';
  var isInit = true;

  tapClear() {
    setState(() {
      valX = 0.0;
      valOps = '';
      valY = 0.0;
      valScreen = '0';
      isInit = true;
    });
  }

  tapChar(String char) {
    setState(() {
      if (isInit) {
        isInit = false;
        if (char == '.') {
          valScreen = '0.';
        } else if (char == '0') {
          valScreen = '0';
        } else {
          valScreen = char;
        }
      } else {
        if (char == '.') {
          var screenX = valScreen.split('.');
          if (screenX.length == 1) {
            valScreen = valScreen + char;
          }
        } else if (char == '0') {
          if (valScreen != '0') {
            valScreen = valScreen + char;
          }
        } else {
          valScreen = valScreen + char;
        }
      }
    });
  }

  tapDelete() {
    setState(
      () {
        var a = valScreen.length;
        valScreen = valScreen.substring(0, a - 1);
        if (a == 1) {
          valScreen = '0';
          isInit = true;
        }
      },
    );
  }

  tapOps(String ops) {
    setState(
      () {
        if (ops == '-') {
          if (isInit) {
            valScreen = ops;
            isInit = false;
          }
        }
        valX = double.parse(valScreen);
        valOps = ops;
        isInit = true;
      },
    );
  }

  tapEquals() {
    setState(
      () {
        var eql = valOps;
        valY = double.parse(valScreen);
        isInit = true;

        if (eql == '+') {
          valScreen = (valX + valY).toString();
        }
        if (eql == '-') {
          valScreen = (valX - valY).toString();
        }
        if (eql == '*') {
          valScreen = (valX * valY).toString();
        }
        if (eql == '/') {
          valScreen = (valX / valY).toString();
        }

        var screenDouble = double.parse(valScreen);
        var screenInt = screenDouble.floor();
        if (screenDouble == screenInt) {
          valScreen = screenInt.toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white30,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 25,
            child: Text(
              'Annisa Putri Wahyuni _ 10 Oktober 2021',
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                // !ini valX
                ContainerScreen(labelScreen: valX.toString()),
                // !ini valOps
                ContainerScreen(labelScreen: valOps),
                // !ini valY
                ContainerScreen(labelScreen: valY.toString()),
              ],
            ),
          ),
          // Row(
          //   // !ini isInit
          //   children: [
          //     ContainerScreen(labelScreen: isInit.toString()),
          //   ],
          // ),
          Expanded(
            flex: 2,
            child: Row(
              // !ini valScreen
              children: [
                ContainerScreen(labelScreen: valScreen),
              ],
            ),
          ),
          Expanded(
            child: Row(
              // !ini tapClear
              children: [
                ContainerTombol(
                  labelTombol: 'C',
                  funChar: () {
                    tapClear();
                  },
                ),
                // !ini tapDelete
                ContainerTombol(
                  labelTombol: 'DEL',
                  funChar: () {
                    tapDelete();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // !ini tapChar
                ContainerTombol(
                  labelTombol: '7',
                  funChar: () {
                    tapChar('7');
                  },
                ),
                ContainerTombol(
                  labelTombol: '8',
                  funChar: () {
                    tapChar('8');
                  },
                ),
                ContainerTombol(
                  labelTombol: '9',
                  funChar: () {
                    tapChar('9');
                  },
                ),
                // !ini tapOps
                ContainerOps(
                  labelOps: '+',
                  funOps: () {
                    tapOps('+');
                  },
                  colorsOps: Colors.grey.shade700,
                ),
              ],
            ),
          ),
          // !ini Tombol
          Expanded(
            child: Row(
              children: [
                // !ini tapChar
                ContainerTombol(
                  labelTombol: '4',
                  funChar: () {
                    tapChar('4');
                  },
                ),
                ContainerTombol(
                  labelTombol: '5',
                  funChar: () {
                    tapChar('5');
                  },
                ),
                ContainerTombol(
                  labelTombol: '6',
                  funChar: () {
                    tapChar('6');
                  },
                ),
                // !ini tapOps
                ContainerOps(
                  labelOps: '-',
                  funOps: () {
                    tapOps('-');
                  },
                  colorsOps: Colors.grey.shade700,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // !ini tapChar
                ContainerTombol(
                  labelTombol: '1',
                  funChar: () {
                    tapChar('1');
                  },
                ),
                ContainerTombol(
                  labelTombol: '2',
                  funChar: () {
                    tapChar('2');
                  },
                ),
                ContainerTombol(
                  labelTombol: '3',
                  funChar: () {
                    tapChar('3');
                  },
                ),
                // !ini tapOps
                ContainerOps(
                  labelOps: 'x',
                  funOps: () {
                    tapOps('*');
                  },
                  colorsOps: Colors.grey.shade700,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // !ini tapChar
                ContainerTombol(
                  labelTombol: '.',
                  funChar: () {
                    tapChar('.');
                  },
                ),
                ContainerTombol(
                  labelTombol: '0',
                  funChar: () {
                    tapChar('0');
                  },
                ),
                // !ini tapOps
                ContainerOps(
                  labelOps: '=',
                  funOps: () {
                    tapEquals();
                  },
                  colorsOps: Colors.red.shade300,
                ),
                ContainerOps(
                  labelOps: '/',
                  funOps: () {
                    tapOps('/');
                  },
                  colorsOps: Colors.grey.shade700,
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 150,
          // ),
        ],
      ),
    );
  }
}
