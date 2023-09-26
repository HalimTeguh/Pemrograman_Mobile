import 'package:flutter/material.dart';
import 'package:navirute_flutter/pages/home_page.dart';
import 'package:navirute_flutter/pages/item_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => HomePage(),
      '/item':(context) => ItemPage(),
    },
  ));
}