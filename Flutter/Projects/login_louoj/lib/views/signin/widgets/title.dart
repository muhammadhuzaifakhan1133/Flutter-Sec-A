import 'package:flutter/material.dart';
import 'package:get/get.dart';

title(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(width: Get.width * 0.22),
      Column(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text("Manufacturer, Wholesaler, Retailer",
              style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    ],
  );
}
