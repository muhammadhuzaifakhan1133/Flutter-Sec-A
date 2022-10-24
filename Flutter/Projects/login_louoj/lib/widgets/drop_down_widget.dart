import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_louoj/controller/signin/card/fabric_card_controller.dart';

Container customDropDownWidget(controller) {
  return Container(
    width: Get.width * 0.6,
    height: Get.height * 0.06,
    decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1),
            borderRadius: BorderRadius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: DropdownButton2(
        isExpanded: true,
        onChanged: (newValue) {
          controller.dropdownvalue.value = newValue as String;
        },
        iconEnabledColor: Colors.blue,
        value: controller.dropdownvalue.value,
        items: (controller.dropdownItems as List<String>)
            .map((item) => DropdownMenuItem(
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black),
                ),
                value: item))
            .toList(),
      ),
    ),
  );
}
