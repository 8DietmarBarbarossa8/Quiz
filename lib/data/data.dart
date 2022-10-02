import 'package:quiz/model/quiz.dart';

void clearUserAnswers() {
  for (var quiz in quizList) {
    quiz.userAnswer = '';
  }
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
      '2022 year',
      '2014 year',
      '2008 year',
      '2011 year',
      '2010 year',
      '2009 year',
      '2013 year',
      '1995 year',
      '1992 year',
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
