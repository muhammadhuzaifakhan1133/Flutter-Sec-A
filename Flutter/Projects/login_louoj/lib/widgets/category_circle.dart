import 'package:flutter/material.dart';

categoryCircle(
    {required String imagePath,
    required double circleAndTextGap,
    required String label,
    required onTapCategory,
    required Color color,
    required TextStyle textStyle}) {
  return Center(
    child: Column(
      children: [
        InkWell(
          onTap: onTapCategory,
          child: CircleAvatar(
            child: Image.asset(imagePath),
            radius: 20,
            backgroundColor: color,
          ),
        ),
        SizedBox(height: circleAndTextGap),
        Text(label, style: textStyle),
      ],
    ),
  );
}
