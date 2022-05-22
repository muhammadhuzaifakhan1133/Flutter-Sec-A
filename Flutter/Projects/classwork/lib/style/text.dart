import 'package:flutter/material.dart';

TextWidget(String data, {size = 12.0, color = Colors.black}) {
  return Text(
    data,
    style: TextStyle(fontSize: size, color: color),
  );
}
