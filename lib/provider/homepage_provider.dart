import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxquesstions = 10;

  List? questions; // To hold the questions
  int _currentquestionsCount = 0;

  BuildContext context;
  HomePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getquestionfromAPI();
    print("Hello");
  }

  Future<void> _getquestionfromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': 'easy',
      },
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    questions = _data["results"];
    notifyListeners();
    print(_data);
  }

//Listd the questions together
  String getCurrentQuestionsText() {
    return questions![_currentquestionsCount]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentquestionsCount]["correct_answer"] == _answer;
    _currentquestionsCount++;
    print(isCorrect ? "Correct" : "Incorrect");
    notifyListeners();
  }
}
