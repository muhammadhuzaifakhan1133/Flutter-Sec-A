import 'package:flutter/material.dart';

Row horizontalLine() {
  return Row(
    children: const [
      Expanded(child: Divider(thickness: 3)),
      Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
      Expanded(child: Divider(thickness: 3))
    ],
  );
}
