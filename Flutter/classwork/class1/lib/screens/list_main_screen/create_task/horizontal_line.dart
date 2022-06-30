import 'package:flutter/material.dart';

Row horizontalOptionalLine() {
  return Row(children: <Widget>[
    Container(width: 50, child: Divider(color: Colors.grey, thickness: 1.5)),
    Container(
        color: Colors.white, child: Center(child: Text("Optional")), width: 80),
    Expanded(child: Divider(color: Colors.grey, thickness: 1.5)),
  ]);
}
