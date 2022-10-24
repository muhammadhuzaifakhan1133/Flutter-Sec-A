import 'package:flutter/material.dart';
import 'package:get/get.dart';

title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(width: Get.width * 0.2),
      Column(
        children: const [
          Text(
            "Fabric",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Manufacturer, Wholesaler, Retailer",
              style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    ],
  );
}
