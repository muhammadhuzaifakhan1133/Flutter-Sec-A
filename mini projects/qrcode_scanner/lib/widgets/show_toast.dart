import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/constants/colors.dart';

showToast(String title, {String message = ""}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    borderWidth: 1,
    borderColor: buttonColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.black,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
