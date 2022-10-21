import 'package:education/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backbutton({double outerRadius = 25, double innerRadius = 23}) {
  return InkWell(
    onTap: () {
      Get.back();
    },
    child: CircleAvatar(
      backgroundColor: onboradingColor,
      radius: outerRadius,
      child: CircleAvatar(
          radius: innerRadius,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_ios,
            color: onboradingColor,
          )),
    ),
  );
}
