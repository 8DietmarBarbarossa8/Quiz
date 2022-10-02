import 'package:flutter/material.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/model/quiz.dart';
import 'package:quiz/screens/result_screen.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool _enablePre = false;
  bool _enableNext = false;
  int _currentQuestionIndex = 0;
  late final List<Quiz> quizes;

  @override
  void initState() {
    quizes = [...quizList];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${_currentQuestionIndex + 1}',
          style: const TextStyle(fontSize: 22),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  quizes[_currentQuestionIndex].question,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Column(
                children: [
                  for (int index = 0;
                      index < quizes[_currentQuestionIndex].answers.length;
                      index++)
                    _radioButtonAnswer(index),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navButton('Previous', _enablePre ? () => _previous() : null),
              _navButton(
                  _currentQuestionIndex != quizes.length - 1
                      ? 'Next'
                      : 'Confirm',
                  _enableNext ? () => _next() : null),
            ],
          ),
        ],
      ),
    );
  }

  RadioListTile<String> _radioButtonAnswer(int index) {
    return RadioListTile(
      title: Text(
        quizes[_currentQuestionIndex].answers[index],
        style: const TextStyle(fontSize: 20),
      ),
      value: quizes[_currentQuestionIndex].answers[index],
      groupValue: quizes[_currentQuestionIndex].userAnswer,
      onChanged: (value) {
        setState(() {
          quizes[_currentQuestionIndex].userAnswer = value.toString();
          _enablePre = _currentQuestionIndex > 0;
          _enableNext = true;
        });
      },
    );
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

  void _previous() {
    if (_currentQuestionIndex < 1) return;
    setState(() {
      _currentQuestionIndex--;
      _updateScreen();
    });
  }

  void _next() {
    if (_currentQuestionIndex >= quizes.length - 1) _finishQuiz();
    setState(() {
      _currentQuestionIndex++;
      _updateScreen();
    });
  }

  void _updateScreen() {
    _enablePre = _currentQuestionIndex >= 1;
    _enableNext = quizes[_currentQuestionIndex].userAnswer.isNotEmpty;
  }

  void _finishQuiz() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                  quizes: quizes,
                )));
  }
}
