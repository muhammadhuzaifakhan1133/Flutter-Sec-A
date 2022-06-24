import 'package:class1/constants/color_constants.dart';
import 'package:flutter/material.dart';

navigateTo(context, goTo) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => goTo),
  );
}

buttonWidget(
    {required BuildContext context,
    required text,
    Color text_color = buttonTextColor,
    double text_size = 16.0,
    Color button_color = buttonColor,
    double width = double.infinity,
    double height = 43.0,
    double radius = 12.0,
    Widget? go_to,
    bool isSignup = false,
    bool isLogin = false,
    onpressed}) {
  return ElevatedButton(
    onPressed: (isSignup || isLogin)
        ? onpressed
        : (() {
            navigateTo(context, go_to);
          }),
    child: Text(
      text,
      style: TextStyle(
          wordSpacing: 3,
          color: text_color,
          fontSize: text_size,
          fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        elevation: 10,
        primary: button_color),
  );
}
