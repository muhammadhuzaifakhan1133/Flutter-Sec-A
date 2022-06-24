import 'package:flutter/material.dart';

Widget CircleImage(character, {radius = 20.0, fontsize = 19.0}) {
  return CircleAvatar(
    child: Text(
      character,
      style: TextStyle(color: Colors.white, fontSize: fontsize),
    ),
    backgroundColor: Colors.blue,
    radius: radius,
  );
}
