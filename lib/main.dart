import 'package:flutter/material.dart';
import 'inputPage.dart';
import 'const.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackGroundColor,
        scaffoldBackgroundColor: kBackGroundColor,
      ),
      home: InputPage(),
    );
  }
}
