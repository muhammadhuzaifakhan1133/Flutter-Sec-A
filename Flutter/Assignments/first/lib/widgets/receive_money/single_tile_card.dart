import 'package:flutter/material.dart';

singleTileCard(
    {required BuildContext context,
    required IconData icon,
    double radius = 15.0,
    Color color = const Color(0xff343645),
    double width = double.infinity,
    double height = 60.0,
    String? title,
    String? trailingText,
    double trailingWidth = 200,
    Color trailingTextColor = const Color(0xffB0BEC5),
    Color iconColor = const Color(0xffB0BEC5),
    enableTrailingText = false}) {
  Widget trailing = Icon(icon, color: iconColor);
  if (enableTrailingText) {
    trailing = Container(
      width: trailingWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(trailingText!,
              style: TextStyle(color: trailingTextColor, fontSize: 16)),
          SizedBox(
            width: 10,
          ),
          trailing
        ],
      ),
    );
  }
  return Container(
    width: width,
    height: height,
    child: Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      color: color,
      child: ListTile(
        title: Text(
          title!,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: trailing,
      ),
    ),
  );
}
