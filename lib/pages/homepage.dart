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
          horizontal: _deviceWidth! * 0.15,
        ),
        child: _gameUI(),
      )),
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _deviceHeight! * 0.05,
            ),
            _falseButton(),
          ],
        )
      ],
    );
  }

  Widget _questionText() {
    return const Text(
      "Nothing intresting",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.12,
      child: const Text(
        "TRUE",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.red,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.12,
      child: const Text(
        "FALSE",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
    );
  }
}
