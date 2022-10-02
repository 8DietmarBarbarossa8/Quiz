import 'package:flutter/material.dart';
import 'package:quiz/model/quiz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _enablePre = false;
  bool _enableNext = false;
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              quizList[_currentQuestionIndex].question,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navButton('Previous', !_enablePre ? () => _previous() : null),
              _navButton('Next', !_enableNext ? () => _next() : null),
            ],
          ),
        ],
      ),
    );
  }

  void _previous() {
    if (_currentQuestionIndex < 1) return;
    setState(() {
      _currentQuestionIndex--;
    });
  }

  void _next() {
    if (_currentQuestionIndex >= quizList.length - 1) return;
    setState(() {
      _currentQuestionIndex++;
    });
  }

  Container _navButton(String text, Function? function) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      width: 120,
      height: 40,
      child: ElevatedButton(
        onPressed: function != null ? () => function() : null,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
