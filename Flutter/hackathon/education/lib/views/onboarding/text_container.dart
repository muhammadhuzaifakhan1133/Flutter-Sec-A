import 'package:education/constants/color.dart';
import 'package:flutter/material.dart';

Expanded textContainer() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Perangkat Lunak",
            style: TextStyle(
                color: onboradingColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Pengolah Gambar Vektor",
            style: TextStyle(
                color: onboradingColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            "Jelajahi AiLearn untuk menambah kemampuanmu dalam mengoperasikan Adobe Illustrator",
            style: TextStyle(color: onboradingColor, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
