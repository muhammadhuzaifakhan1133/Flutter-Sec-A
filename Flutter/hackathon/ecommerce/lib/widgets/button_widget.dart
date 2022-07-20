import 'package:flutter/material.dart';

Widget buttonWidget(
    {required Size size,
    required String text,
    required onpressed,
    bool enable = true,
    double topPadding = 15,
    Color textColor = Colors.white,
    double textSize = 18,
    double widthPercent = 0.8,
    double heightPercent = 0.06,
    double radius = 15,
    Color buttonColor = Colors.black}) {
  return Padding(
    padding: EdgeInsets.only(top: topPadding),
    child: ElevatedButton(
        onPressed: enable ? onpressed : null,
        style: ElevatedButton.styleFrom(
            minimumSize:
                Size(size.width * widthPercent, size.height * heightPercent),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(radius)),
            elevation: 10,
            primary: buttonColor),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
        )),
  );
}
