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
            
          ],
        ),
      )
    );
  }
}

