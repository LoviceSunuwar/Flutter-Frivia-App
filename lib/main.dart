import 'package:flutter/material.dart';
import 'package:frivia_flutter/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FrviaFlutterApp',
      theme: ThemeData(
          fontFamily: 'Oswald', scaffoldBackgroundColor: Colors.amber),
      home: HomePage(),
    );
  }
}
