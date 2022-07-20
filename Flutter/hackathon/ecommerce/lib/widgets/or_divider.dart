import 'package:flutter/material.dart';

orDivider() {
  return Row(children: <Widget>[
    Expanded(child: Divider(thickness: 1.5)),
    Text(
      "OR",
      style: TextStyle(fontSize: 16),
    ),
    Expanded(
        child: Divider(
      thickness: 1.5,
    )),
  ]);
}
