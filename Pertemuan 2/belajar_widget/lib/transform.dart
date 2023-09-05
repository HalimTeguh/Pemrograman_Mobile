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
        body: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.only(left: 30, right: 30, top: 50),
              transform: Matrix4.rotationZ(-0.1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 10),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image(
                image: NetworkImage('https://images.unsplash.com/photo-1682685797303-0ad51eb23e13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                fit: BoxFit.fitWidth,),
            ),
          ],
        ),
      )
    );
  }
}

