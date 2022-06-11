import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

import '../../screens/login.dart';

buttonWidget(context, {border_radius, width, height, text, go_to}) {
  var constants = UserConstants();
  return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border_radius));
          }),
          minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
          backgroundColor:
              MaterialStateProperty.all<Color>(constants.button_color)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => go_to),
        );
      },
      child: Text(
        text,
        style: TextStyle(
            color: constants.txt_color,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ));
}
