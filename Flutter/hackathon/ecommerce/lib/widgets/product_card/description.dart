import 'package:flutter/material.dart';

Widget productDescription({required String description}) {
  return Text(
    description,
    textAlign: TextAlign.left,
    style: TextStyle(fontSize: 14),
  );
}
