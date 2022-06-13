import 'package:first/widgets/home/rectangular_section.dart';
import 'package:flutter/material.dart';

moneyTransferSection() {
  return rectangularSectionWidget(
      title: "Money Transfer",
      icon1: Icons.qr_code_scanner,
      right_color1: Color.fromRGBO(91, 46, 98, 1),
      left_color1: Color.fromRGBO(91, 46, 140, 1),
      text1: "Scan QR Code",
      icon2: Icons.account_box,
      right_color2: Color.fromRGBO(46, 98, 76, 1),
      left_color2: Color.fromRGBO(46, 98, 90, 1),
      text2: "Send to Contact",
      icon3: Icons.account_balance_sharp,
      right_color3: Color.fromRGBO(94, 98, 46, 1),
      left_color3: Color.fromRGBO(94, 130, 46, 1),
      text3: "Send to Bank",
      icon4: Icons.update,
      right_color4: Color.fromRGBO(98, 46, 58, 1),
      left_color4: Color.fromRGBO(120, 46, 58, 1),
      text4: "Self Transfer");
}
