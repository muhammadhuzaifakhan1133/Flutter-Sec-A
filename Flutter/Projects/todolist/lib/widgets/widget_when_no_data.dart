import 'package:flutter/cupertino.dart';

Widget widgetWhenNoData(
    {required IconData icon,
    required String text,
    required Color color,
    double size = 100,
    double topPadding = 0}) {
  return Padding(
    padding: EdgeInsets.only(top: topPadding),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: color),
        SizedBox(height: 10),
        Container(
          width: 200,
          child: Text(text,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        )
      ],
    )),
  );
}
