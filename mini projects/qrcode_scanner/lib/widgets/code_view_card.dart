import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget codeViewCard({required getxController}) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.25,
        child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(() => Text(getxController.code.value)),
            ))),
  );
}
