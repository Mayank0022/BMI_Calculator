import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.choosen});
  final IconData icon;
  final Function choosen;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: choosen,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
