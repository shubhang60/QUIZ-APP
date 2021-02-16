import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //implement create state
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite colour',
      'answers': [
        {'text': 'red', 'score': 5},
        {'text': 'blue', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'black', 'score': 8},
      ],
    },
    {
      'questionText': 'what\'s your favourite animal',
      'answers': [
        {'text': 'rat ', 'score': 9},
        {'text': 'bat', 'score': 15},
        {'text': 'goat', 'score': 6},
        {'text': 'boar', 'score': 20},
      ],
    },
    {
      'questionText': 'what\'s your favourite sports',
      'answers': [
        {'text': 'running', 'score': 1},
        {'text': 'bat and ball', 'score': 2},
        {'text': 'football', 'score': 2},
        {'text': 'basketball', 'score': 4}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
