import 'package:flutter/material.dart';

class ReausableCard extends StatelessWidget {
  ReausableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress,
      @required this.number});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final double number;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(number, 10.0, number, 10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
