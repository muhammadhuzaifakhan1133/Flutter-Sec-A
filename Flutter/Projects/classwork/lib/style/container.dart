import 'package:flutter/material.dart';

ContainerWidget({width = 200.0, height = 200.0, color = Colors.blue, child}) {
  return Container(
    width: width,
    height: height,
    color: color,
    child: child,
  );
}
