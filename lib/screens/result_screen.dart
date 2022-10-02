import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/model/quiz.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:share/share.dart';

class ResultPage extends StatelessWidget {
  final List<Quiz> quizes;

  const ResultPage({Key? key, required this.quizes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int result = _calculateResult();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Your result: $result %",
              style: const TextStyle(
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          _icon(Icons.share, () => _share(result)),
          _icon(Icons.arrow_back, () => _retakeQuiz(context)),
          _icon(Icons.close, () => _exitFromApp()),
        ],
      ),
    );
  }

  int _calculateResult() {
    int right = 0;
    for (var quiz in quizes) {
      if (quiz.userAnswer == quiz.rightAnswer) right++;
    }
    return (right / quizes.length * 100).round();
  }

  IconButton _icon(IconData iconData, Function function) {
    return IconButton(
      onPressed: () => function(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: 75,
      icon: Icon(iconData),
      color: Colors.blueGrey,
    );
  }

  void _share(int result) {
    String message = 'Quiz (result: $result %)\n\n';
    for (Quiz quiz in quizes) {
      message += '${quiz.question}\n';
      List<String> answers = quiz.answers;
      for (int i = 0; i < answers.length; i++) {
        message += '${i + 1}) ${answers[i]}\n';
      }
      message += 'Your answer: ${quiz.userAnswer}\n';
      message += 'Right answer: ${quiz.rightAnswer}\n';
      message += '\n';
    }
    Share.share(message);
  }

  void _retakeQuiz(BuildContext context) {
    clearUserAnswers();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const QuestionPage()));
  }

  void _exitFromApp() {
    SystemNavigator.pop();
  }
}
