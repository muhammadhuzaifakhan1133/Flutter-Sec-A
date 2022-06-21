import 'package:flutter/material.dart';

navigateTo(context, goTo) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => goTo),
  );
}

buttonWidget(
    {required BuildContext context,
    text,
    text_color = Colors.white,
    text_size = 16.0,
    button_color,
    width = double.infinity,
    height = 43.0,
    radius = 12.0,
    go_to}) {
  return ElevatedButton(
    onPressed: () {
      navigateTo(context, go_to);
    },
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
