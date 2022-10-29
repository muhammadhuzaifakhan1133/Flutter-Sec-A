import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/widgets/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanCodeController extends GetxController {
  RxString code = "".obs;

  copyText({String? text}) async {
    if (text == null) {
      text = code.value;
    }
    await Clipboard.setData(ClipboardData(text: text));
    showToast("Copied", message: "You can paste it anywhere");
  }

  gotoWebsite({String? text}) async {
    if (text == null) {
      text = code.value;
    }
    try {
      Uri uriCode = Uri.parse(text);
      if (!await launchUrl(uriCode, mode: LaunchMode.externalApplication)) {
        showToast("Could not launch URL",
            message: "Seems Like It is not a URL");
      }
    } catch (e) {
      showToast("Could not launch URL", message: "Seems Like It is not a URL");
    }
  }
}
