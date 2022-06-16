import 'package:flutter/material.dart';

buttonWithSuffixIcon(
    {String? text,
    String? iconPath,
    double width = 95.0,
    double height = 35.0,
    double gapBetweenTextAndIcon = 7.0}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: Color(0xff343645),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        text!,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      SizedBox(
        width: gapBetweenTextAndIcon,
      ),
      Image(color: Colors.white, image: AssetImage(iconPath!)),
      SizedBox(
        width: 3,
      ),
    ]),
  );
}
