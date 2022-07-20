import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

secondTextRow() {
  return Row(
    children: [
      Text(
        "Featured",
        style: TextStyle(
            color: themeColor, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    ],
  );
}
