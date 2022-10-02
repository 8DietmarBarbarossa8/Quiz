class Quiz {
  final String question;
  final List<String> answers;
  final int rightAnswerNumber;
  String get rightAnswer => answers[rightAnswerNumber - 1];
  String userAnswer = '';

  Quiz(
      {required this.question,
      required this.answers,
      required this.rightAnswerNumber});
}
