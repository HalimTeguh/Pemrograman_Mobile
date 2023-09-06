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
      home: Container(
        color: Colors.white,
        child: Column(
          children: [
            //Header
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: Text("Ini Header"),
            ),
            //Body
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    color: Colors.red,
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}

