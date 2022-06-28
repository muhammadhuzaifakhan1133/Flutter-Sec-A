import 'package:flutter/material.dart';

Widget suffixIcon(obscureText) {
  if (obscureText) {
    return Icon(
      Icons.visibility,
      color: Colors.grey,
    );
  } else {
    return Icon(
      Icons.visibility_off,
      color: Colors.grey,
    );
  }
}
