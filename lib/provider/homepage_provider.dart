import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  BuildContext context;
  HomePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    print("Hello");
  }
}
