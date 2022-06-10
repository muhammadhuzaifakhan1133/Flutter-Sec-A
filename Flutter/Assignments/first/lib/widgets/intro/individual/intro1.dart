import 'package:flutter/material.dart';

introImg({bgcolor, img}) {
  return Container(
    padding: EdgeInsets.all(20),
    child: CircleAvatar(
      backgroundColor: bgcolor,
      radius: 70,
      child: Image.asset(
        "${img}",
        width: 150,
        height: 150,
      ),
    ),
  );
}
