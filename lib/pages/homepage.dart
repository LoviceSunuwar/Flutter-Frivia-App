import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceHeight! * 0.15,
        ),
        child: _gameUI(),
      )),
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [_questionText()],
    );
  }

  Widget _questionText() {
    return const Text(
      "Nothing intresting",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
    );
  }
}
