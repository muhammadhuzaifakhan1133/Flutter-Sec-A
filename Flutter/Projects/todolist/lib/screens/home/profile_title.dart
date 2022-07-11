import 'package:flutter/material.dart';

Row profileTitle(name, {bool home = true}) {
  return Row(
    children: [
      Text(name),
      Icon(home ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up)
    ],
  );
}
