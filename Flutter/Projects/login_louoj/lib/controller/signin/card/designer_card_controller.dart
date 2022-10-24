import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignerCardController extends GetxController {
  RxString dropdownvalue = "Admin".obs;
  List<String> dropdownItems = ["Admin", "Designer"];
  TextEditingController storeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
