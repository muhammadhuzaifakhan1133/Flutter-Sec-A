import 'package:first/widgets/home/rectangular_section.dart';
import 'package:flutter/material.dart';

rechargeAndBillPaymentSection() {
  return rectangularSectionWidget(
      title: "Recharge & Bill Payments",
      icon1: Icons.mobile_friendly,
      right_color1: Color.fromRGBO(50, 101, 42, 1),
      left_color1: Color.fromRGBO(50, 101, 80, 1),
      text1: "Mobile Recharge",
      icon2: Icons.sunny,
      right_color2: Color.fromRGBO(101, 42, 95, 1),
      left_color2: Color.fromRGBO(110, 60, 95, 1),
      text2: "Electricity Bill",
      icon3: Icons.video_file,
      right_color3: Color.fromRGBO(101, 42, 42, 1),
      left_color3: Color.fromRGBO(101, 60, 42, 1),
      text3: "DTH Recharge",
      icon4: Icons.camera_roll,
      right_color4: Color.fromRGBO(42, 64, 101, 1),
      left_color4: Color.fromRGBO(60, 64, 101, 1),
      text4: "Postpaid Bill");
}
