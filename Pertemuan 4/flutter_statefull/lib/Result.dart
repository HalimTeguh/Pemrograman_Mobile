import 'package:flutter/material.dart';
import '';

class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(children: [
        Text(
          "Hasil",
          style: TextStyle(
            fontSize: 20
          ),
        ),
        Text(
          result.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
      ]),
    );
  }
}

