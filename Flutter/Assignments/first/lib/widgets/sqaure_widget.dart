import 'package:flutter/material.dart';

square(
    {width,
    height,
    padding = 3.0,
    radius = 10.0,
    child = null,
    color = const Color.fromRGBO(36, 32, 66, 1)}) {
  return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(3),
      // color: Colors.purple[900],
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: child);
}
