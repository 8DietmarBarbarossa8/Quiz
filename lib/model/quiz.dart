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

List<Quiz> quizList = [
  Quiz(
    question: 'What is the capital of Tajikistan?',
    answers: [
      'Berlin',
      'Dushanbe',
      'Bishkek',
      'Cabul',
      'Tashkent',
      'Astana',
      'Ashgabat'
    ],
    rightAnswerNumber: 2,
  ),
  Quiz(
    question: 'In which country was born company "Peugeot"?',
    answers: [
      'Germany',
      'Korea',
      'Japan',
      'Russia',
      'France',
    ],
    rightAnswerNumber: 5,
  ),
  Quiz(
    question: 'What modern name of Persia?',
    answers: [
      'Iran',
      'Ayran',
      'Iraq',
      'Tajikistan',
      'Afghanistan',
    ],
    rightAnswerNumber: 1,
  ),
  Quiz(
    question: 'What year did Dart language appear?',
    answers: [
      '2022',
      '2014',
      '2008',
      '2011',
      '2010',
      '2009',
      '2013',
      '1995',
      '1992',
    ],
    rightAnswerNumber: 4,
  ),
  Quiz(
    question: 'Which math formula for triangle square is correct?',
    answers: [
      's = a * b',
      's = a * b * c',
      's = a * h * 0.5',
      's = a * h / 3',
      's = (a + b + c) / 3',
    ],
    rightAnswerNumber: 3,
  ),
];
