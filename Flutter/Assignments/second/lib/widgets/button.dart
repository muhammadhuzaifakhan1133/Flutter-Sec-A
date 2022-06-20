import 'package:flutter/material.dart';

Widget button(
    String label, double buttonWidth, double buttonHeight, Color buttonColor,
    {required void Function() onTap,
    Color color = Colors.green,
    bool roundBorder = false}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular((roundBorder == true) ? 15 : 0)),
      height: buttonHeight,
      width: buttonWidth,
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: color, fontSize: 23),
        ),
      ),
    ),
  );
}
