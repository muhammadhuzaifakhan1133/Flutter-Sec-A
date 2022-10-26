import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/widgets/show_toast.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class CreateCodeController extends GetxController {
  Rx<String> data = "".obs;

  void generateQrCode(String text) {
    if (text.isEmpty) {
      showToast("No Text Found");
      return;
    }
    data.value = text;
  }

  Future<void> shareQrCode(ScreenshotController screenshotController) async {
    Uint8List? image = await screenshotController.capture();
    final Directory directory = (await getTemporaryDirectory());
    final File imagePath = await File("${directory.path}/qr.png").create();
    await imagePath.writeAsBytes(fileToBytes(image));
    await Share.shareFiles([imagePath.path]);
  }
}
