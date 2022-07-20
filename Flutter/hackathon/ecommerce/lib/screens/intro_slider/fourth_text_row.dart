import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

fourthTextRow(List<String> actorNames, List<String> slidesText, int i) {
  return RichText(
    text: TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 20.0,
        color: textColor,
      ),
      children: <TextSpan>[
        TextSpan(
            text: actorNames[i - 1],
            style: const TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: slidesText[i - 1]),
      ],
    ),
  );
}
