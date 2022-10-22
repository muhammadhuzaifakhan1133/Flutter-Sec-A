import 'package:flutter/material.dart';

Row profileTitle(name, {bool home = true}) {
  return Row(
    children: [
      Text(name),
    ],
  );
}
