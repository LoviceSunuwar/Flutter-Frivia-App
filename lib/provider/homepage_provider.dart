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
    //print(_data); This is to check the data on console
  }

//Listd the questions together
  String getCurrentQuestionsText() {
    return questions![_currentquestionsCount]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentquestionsCount]["correct_answer"] == _answer;
    _currentquestionsCount++;
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
              backgroundColor: isCorrect ? Colors.green : Colors.red,
              title: Icon(
                isCorrect ? Icons.check_circle : Icons.cancel_sharp,
                color: Colors.white,
              ));
        });

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    // print(isCorrect ? "Correct" : "Incorrect");
    notifyListeners();
  }
}
