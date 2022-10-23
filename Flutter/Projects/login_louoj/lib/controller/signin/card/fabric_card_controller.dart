import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FabricCardController extends GetxController {
  RxString dropdownvalue = "Admin".obs;
  List<String> dropdownItems = ["Admin", "Fabric"];
  TextEditingController storeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
