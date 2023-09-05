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
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          color: Colors.blueAccent,
                          child: FlutterLogo(size: 80,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          color: Colors.redAccent,
                          child: FlutterLogo(size: 80,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          color: Colors.greenAccent,
                          child: FlutterLogo(size: 80,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.yellowAccent,
                    child: FlutterLogo(size: 80,),
                  ),Container(
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.orangeAccent,
                    child: FlutterLogo(size: 80,),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

