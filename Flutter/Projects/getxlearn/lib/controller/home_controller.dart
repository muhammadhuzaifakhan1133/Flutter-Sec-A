import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> counter = 0.obs;

  // @override
  // onInit() {
  //   super.onInit();
  //   counter = 5;
  // }

  // @override
  // onReady() {
  //   counter = 5.ob;
  //   update();
  // }

  addValue() {
    counter.value++;
  }
}
