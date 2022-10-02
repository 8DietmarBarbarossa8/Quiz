import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/tools/question_colors.dart';
import 'package:quiz/screens/question_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String _appTitle = 'Quiz';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: QuestionColors.random(),
      ),
      home: MyHomePage(title: _appTitle),
    );
  }
}
