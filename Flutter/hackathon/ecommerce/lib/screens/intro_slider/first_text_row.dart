import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

firstTextRow(int i) {
  return Row(
    children: [
      Text("NO",
          style: TextStyle(
              fontSize: 17.55,
              decoration: TextDecoration.underline,
              color: textColor)),
      Text(
        "$i",
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 51.84),
      )
    ],
  );
}
