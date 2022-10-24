import 'package:flutter/material.dart';
import 'package:get/get.dart';

textfieldWidget({getxController, String? hintText, required IconData icon}) {
  return SizedBox(
    width: Get.width * 0.6,
    child: TextField(
      controller: getxController.storeController,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          suffixIcon: Icon(icon, color: Colors.blue),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}
