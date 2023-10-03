import 'package:flutter/material.dart';
import 'package:sqlite_flutter/models/item.dart';
import 'package:sqlite_flutter/pages/entry_form.dart';
import 'package:sqlite_flutter/pages/home_page.dart';
import 'package:sqlite_flutter/pages/item_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => EntryForm(item: Item("Buah", 1000)),
      '/item':(context) => ItemPage(),
    },
  ));
}