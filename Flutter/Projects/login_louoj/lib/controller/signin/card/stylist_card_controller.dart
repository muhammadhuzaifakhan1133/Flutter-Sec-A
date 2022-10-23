import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StylistCardController extends GetxController {
  RxString dropdownvalue = "Admin".obs;
  List<String> dropdownItems = ["Admin", "Stylist"];
  TextEditingController storeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
