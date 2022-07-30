import 'package:flutter/material.dart';

Widget designerInfo(
    {required String imgPath, required String name, required String status}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(imgPath),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              status,
              style: TextStyle(
                  letterSpacing: 2, color: Color(0xffD6D6D6), fontSize: 10.57),
            ),
          ],
        ),
      )
    ],
  );
}
