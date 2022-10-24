import 'package:flutter/material.dart';

Container buttonWidget(
    {String buttonText = "LOGIN", Color? color = Colors.black, double? width}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Text(
        buttonText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
