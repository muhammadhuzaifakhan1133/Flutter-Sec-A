import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

introDescription({description_text}) {
  var constants = UserConstants();
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text(
      "$description_text",
      style: TextStyle(color: constants.txt_color, fontSize: 14, height: 1.5),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    ),
  );
}
