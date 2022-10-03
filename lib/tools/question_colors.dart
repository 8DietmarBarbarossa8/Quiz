import 'package:flutter/material.dart';

class QuestionColors {
  static final List<MaterialColor> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.cyan,
    Colors.grey,
    Colors.pink,
    Colors.blueGrey,
    Colors.lime,
    Colors.teal,
    Colors.amber,
    Colors.brown,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  static List<MaterialColor> generateRandomColors(int size) {
    List<int> positions = [for (int i = 0; i < _colors.length; i++) i];
    positions.shuffle();
    return [for (int i = 0; i < size; i++) _colors[positions[i]]];
  }
}
