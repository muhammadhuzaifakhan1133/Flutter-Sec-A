import 'package:flutter/material.dart';

backButton(context) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
