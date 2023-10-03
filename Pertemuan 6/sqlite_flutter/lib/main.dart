import 'package:flutter/material.dart';
import 'package:sqlite_flutter/pages/home_page.dart';
import 'package:sqlite_flutter/pages/item_page.dart';

// void main() {
//   runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//       '/':(context) => const HomePage(),
//       '/item':(context) => const ItemPage(),
//     },
//   ));
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}