import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget textFieldToShowCode({required getxController}) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Container(
        width: Get.width * 0.8,
        child: Obx(() => TextField(
              maxLines: 6,
              enabled: false,
              controller:
                  TextEditingController(text: getxController.code.value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15))),
            ))),
  );
}
