import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inibaru/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Manager'),
        // backgroundColor: Colors.grey.shade600,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Text(
                'My Aplikasi',
                // textScaleFactor: 1.5,
              ),
            ],
          ),

          ListTileX(
            labelX: const Text('Calculator'),
            iconX: const Icon(Icons.calculate),
            funX: () {
              final route = MaterialPageRoute(
                builder: (context) {
                  return const CalculatorPage();
                },
              );
              Navigator.push(context, route);
            },
          ),
          // const ListTileX(
          //   labelX: Text('Calender'),
          //   iconX: Icon(Icons.calendar_today_outlined),
          // ),
          // const ListTileX(
          //   labelX: Text('Clock'),
          //   iconX: Icon(Icons.timelapse_outlined),
          // ),
          // const ListTileX(),
          // const ListTileX(),
          // const ListTileX(),
          // const ListTileX(),
        ],
      ),
    );
  }
}

class ListTileX extends StatelessWidget {
  final Text labelX;
  final Icon iconX;

  final Function funX;
  const ListTileX({
    Key? key,
    required this.labelX,
    required this.iconX,
    required this.funX,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: labelX,
      leading: iconX,

      // tileColor: Colors.grey.shade200,
      onTap: () {
        funX();
      },

      // subtitle: Text('My Calculator'),
    );
  }
}
