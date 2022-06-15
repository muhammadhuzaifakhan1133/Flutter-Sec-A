import 'package:flutter/material.dart';

singleTileCard(
    {required BuildContext context,
    required IconData icon,
    double radius = 15.0,
    Color color = const Color(0xff343645),
    double width = double.infinity,
    double height = 60.0,
    String? startText,
    String? endText,
    Color startTextColor = Colors.white,
    Color endTextColor = const Color(0xffB0BEC5),
    Color iconColor = const Color(0xffB0BEC5)}) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      color: color,
      child: Container(
        padding: EdgeInsets.only(top: 7, bottom: 7, right: 7, left: 23),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(startText!,
                style: TextStyle(color: startTextColor, fontSize: 15)),
            Row(children: [
              Text(endText!,
                  style: TextStyle(color: endTextColor, fontSize: 15)),
              SizedBox(
                width: 7,
              ),
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(
                width: 8,
              )
            ])
          ],
        ),
      ));
}
