import 'package:get/get.dart';
import 'package:qrcode_scanner/constants/colors.dart';

deleteDialog(controller, key,
    {int? index, required String title, required String middleText}) {
  return Get.defaultDialog(
      title: title,
      middleText: middleText,
      onCancel: () {
        Get.back();
      },
      buttonColor: buttonColor,
      onConfirm: () async {
        await controller.deleteHistory(key, index: index);
        Get.back();
      },
      textCancel: "No",
      textConfirm: "Yes");
}
