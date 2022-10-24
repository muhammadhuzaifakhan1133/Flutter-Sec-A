import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FactoryCardController extends GetxController {
  RxString dropdownvalue = "Admin".obs;
  List<String> dropdownItems = ["Admin", "Factory"];
  TextEditingController storeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
