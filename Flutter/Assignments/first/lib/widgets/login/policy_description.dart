import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

policyDescription() {
  var constants = UserConstants();
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      children: [
        Text(
          "Your personal details are safe with us",
          style: TextStyle(color: constants.privacy_txt_color, fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Read our Privacy Policy and Terms and Conditions",
          style: TextStyle(color: constants.privacy_txt_color, fontSize: 11),
        )
      ],
    ),
  );
}
