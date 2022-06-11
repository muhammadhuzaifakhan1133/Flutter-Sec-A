import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

introTitle({title}) {
  var constants = UserConstants();
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      "${title}",
      style: TextStyle(color: constants.txt_color, fontSize: 25),
    ),
  );
}
