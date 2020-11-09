import 'package:flutter/material.dart';
import 'const.dart';

class BottomCard extends StatelessWidget {
  BottomCard({@required this.ontap, @required this.text});
  final Function ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        color: kPinkColor,
        height: kBottomBarHeight,
      ),
    );
  }
}
