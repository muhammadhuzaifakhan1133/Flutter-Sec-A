import 'package:first/constants/user_constants.dart';
import 'package:first/screens/login.dart';
import 'package:first/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

lastPageMaterial(context) {
  var constants = UserConstants();
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(
      top: 65,
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        buttonWidget(context,
            border_radius: 10.0,
            width: 50.0,
            height: 40.0,
            text: "INSTANT PAY",
            go_to: Login()),
        Text(
          "Your perfect payment partner",
          style: TextStyle(
            color: constants.txt_color,
            fontSize: 15,
          ),
        )
      ],
    ),
  );
}
