import 'package:flutter/material.dart';
import 'dart:async';

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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.all(50),
              height: 200,
              width: 200,
              alignment: Alignment.topCenter,
              color: Colors.blueGrey,
              child: Text(
                "Belajar Flutter",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
                onPressed: () {},
                child: Text(
                  "Button",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://pixnio.com/free-images/2017/03/07/2017-03-07-10-59-39-900x600.jpg'),
                  fit: BoxFit.fitWidth,
                  ),
                border: Border.all(
                  color: Colors.blue,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 200,
              width: 300,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
              transform: Matrix4.rotationZ(-0.1),
            ),
          ],
        ),
      )
    );
  }
}

