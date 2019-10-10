import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp()); // run app call build method inside the instantiated class
// }

// one line function sample
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'White', 'score': 2},
        {'text': 'Blue', 'score': 4},
        {'text': 'Green', 'score': 6},
        {'text': 'Black', 'score': 8},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Panda', 'score': 4},
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 6},
        {'text': 'Mouse', 'score': 8},
      ],
    },
    {
      'questionText': 'Who\'s your favourite person?',
      'answers': [
        {'text': 'Bob', 'score': 2},
        {'text': 'Bob', 'score': 4},
        {'text': 'Bob', 'score': 6},
        {'text': 'Bob', 'score': 8},
      ],
    },
  ];
  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print('Total score is $_totalScore.');
  }

  @override // << this is called a decorator (make the code more readable)
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app!'),
        ),
        body: _questionIndex <
                _questions.length // ternary if there is more question to go
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
