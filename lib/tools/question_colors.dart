import 'dart:math';

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
  ];
  
  static final Random _random = Random();

  static MaterialColor random() => _colors[_random.nextInt(_colors.length)];
}