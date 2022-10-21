import 'package:get/get.dart';

class CustomBottomBarController extends GetxController {
  Rx<int> index = 0.obs;

  changeIndex(int currentIndex) {
    index.value = currentIndex;
  }
}
