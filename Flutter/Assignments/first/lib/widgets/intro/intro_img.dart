import 'package:flutter/material.dart';

introImg({bgcolor, img, context}) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    padding: const EdgeInsets.all(20),
    child: CircleAvatar(
      backgroundColor: bgcolor,
      radius: 70,
      child: Image.asset(
        "$img",
        width: 150,
        height: 150,
      ),
    ),
  );
}
