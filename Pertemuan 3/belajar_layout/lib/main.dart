import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ListView Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("2", style: TextStyle(fontSize: 30, color: Colors.white),),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("2", style: TextStyle(fontSize: 30, color: Colors.white),),
          ),
          Container(
            color: Colors.redAccent,
            alignment: Alignment.center,
            child: Text("2", style: TextStyle(fontSize: 30, color: Colors.white),),
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Text("2", style: TextStyle(fontSize: 30, color: Colors.white),),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
