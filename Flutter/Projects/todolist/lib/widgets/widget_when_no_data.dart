import 'package:flutter/cupertino.dart';

Widget widgetWhenNoData(
    {required IconData icon, required String text, required Color color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 200.0),
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
