import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quick_quiz/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'The tallest building in the world is located in which city?',
      'answers': [
        {'text': 'Washinton', 'score': 0},
        {'text': 'Dubai (Burj Khalifa)', 'score': 1},
        {'text': 'jojo Town', 'score': 0},
        {'text': 'Nigeria', 'score': 0}
      ]
    },
    {
      'questionText':
          'Which year was the original Toy Story film released in the US?',
      'answers': [
        {'text': '1995', 'score': 1},
        {'text': '1999', 'score': 0},
        {'text': '1990', 'score': 0},
        {'text': '1989', 'score': 0}
      ]
    },
    {
      'questionText': 'Name the current UK Chancellor of the Exchequer',
      'answers': [
        {'text': 'Elon Musk', 'score': 0},
        {'text': 'John Luka', 'score': 0},
        {'text': 'Micheal Obama', 'score': 0},
        {'text': 'Rishi Sunak', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    if (_questionIndex < _questions.length) {
      print("We have more question!");
    } else {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quick_quiz"),
        ),
        //the q
        body:  _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
