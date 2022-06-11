import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/login/images.dart';
import 'package:flutter/material.dart';

loginDesign() {
  var constants = UserConstants();
  return Container(
      height: 500,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 100, left: 40, right: 70),
        child: Column(
          children: [
            Text(
              "LOGIN WITH YOUR MOBILE PHONE NUMBER",
              maxLines: 3,
              style: TextStyle(
                  color: constants.txt_color,
                  fontSize: 25,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold),
            ),
            loginImages(),
          ],
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_bg_purple.png"),
              fit: BoxFit.fill)));
}
