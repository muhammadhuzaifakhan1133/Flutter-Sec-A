import 'package:flutter/material.dart';
import 'package:get/get.dart';

showToast(String msg) {
  Get.snackbar(
    msg,
    "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 1),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
  // Fluttertoast.cancel();
  // Fluttertoast.showToast(msg: msg);
}
