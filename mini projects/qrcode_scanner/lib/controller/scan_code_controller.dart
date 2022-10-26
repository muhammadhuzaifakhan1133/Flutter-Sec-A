import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/widgets/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScanCodeController extends GetxController {
  RxString code = "".obs;

  copyText() async {
    await Clipboard.setData(ClipboardData(text: code.value));
    showToast("Copied to Clipboard");
  }

  gotoWebsite() async {
    try {
      Uri uriCode = Uri.parse(code.value);
      if (!await launchUrl(uriCode, mode: LaunchMode.externalApplication)) {
        showToast("Could not launch URL");
      }
    } catch (e) {
      showToast("Could not launch URL");
    }
  }
}
