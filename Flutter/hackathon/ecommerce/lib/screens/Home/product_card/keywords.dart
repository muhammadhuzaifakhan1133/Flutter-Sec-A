import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

Widget productKeywords(List<dynamic> keywords) {
  List<Widget> keywordTags = [];
  for (var i = 0; i < keywords.length; i++) {
    keywordTags.add(Container(
      child: Card(
        elevation: 4,
        color: themeColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text("#${keywords[i]}",
                  style: TextStyle(color: Colors.white))),
        ),
      ),
    ));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: keywordTags,
  );
}
