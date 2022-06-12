import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/home/more_button.dart';
import 'package:first/widgets/home/rectangle_box_widget.dart';
import 'package:flutter/material.dart';

moneyTransferSection() {
  var constants = UserConstants();
  return Container(
    child: Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Money Transfer",
                style: TextStyle(
                  color: constants.txt_color,
                  fontSize: 22,
                ),
              ),
              moreButton()
            ]),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              rectangleBoxWidget(
                  icon: Icons.qr_code,
                  left_color: Color(0xff5B2E62),
                  right_color: Colors.purple,
                  text: "Scan QR Code"),
              rectangleBoxWidget(
                  icon: Icons.qr_code,
                  left_color: Colors.purple,
                  right_color: Color(0xff5B2E62),
                  text: "Scan QR Code")
            ],
          ),
        ),
        Row(
          children: [
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            ),
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
