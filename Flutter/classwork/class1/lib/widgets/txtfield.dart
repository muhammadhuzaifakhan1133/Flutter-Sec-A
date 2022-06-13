import 'package:flutter/material.dart';

textFieldWidget(controller) {
  return Container(
    padding: EdgeInsets.only(right: 7, left: 7),
    margin: EdgeInsets.only(top: 20),
    width: 200,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(hintText: "Enter title for new row"),
    ),
  );
}
