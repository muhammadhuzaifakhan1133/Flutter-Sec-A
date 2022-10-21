import 'package:education/constants/color.dart';
import 'package:flutter/material.dart';

signupText(context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Selamat Datang!",
        style: TextStyle(
            color: onboradingColor, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: EdgeInsets.only(right: size.width * 0.2),
        child: Text(
          "Masukan NISN dan password untuk memulai belajar sekarang",
          maxLines: 2,
          style: TextStyle(color: onboradingColor, fontSize: 15),
        ),
      ),
    ],
  );
}
