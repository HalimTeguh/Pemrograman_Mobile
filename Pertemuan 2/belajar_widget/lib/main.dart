import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Belajar Container")),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              color: Colors.greenAccent,
              alignment: Alignment.bottomCenter,
              child: Text("Satu", 
              style: TextStyle(
                fontSize: 30,
                color: Colors.white),),
            ),
            Container(
              width: 300,
              height: 400,
              color: Colors.blueAccent,
              alignment: Alignment.bottomCenter,
              child: Text("Dua", 
              style: TextStyle(
                fontSize: 30,
                color: Colors.white),),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.redAccent,
              alignment: Alignment.bottomCenter,
              child: Text("Tiga", 
              style: TextStyle(
                fontSize: 30,
                color: Colors.white),),
            )
          ],
        )
      )
    );
  }
}

