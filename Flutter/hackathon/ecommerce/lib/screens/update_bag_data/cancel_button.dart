import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

cancelButton(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: themeColor),
      onPressed: () {
        Navigator.pop(context, false);
      },
      child: Text("Cancle"));
}
