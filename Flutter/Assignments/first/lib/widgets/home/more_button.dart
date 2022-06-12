import 'package:flutter/material.dart';

moreButton() {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xff343645),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    width: 60,
    height: 25,
    // color: Color(0xff343645),
    child: Center(
      child: Text(
        "More >",
        style: TextStyle(color: Color(0xff696D78), fontSize: 13),
      ),
    ),
  );
}
