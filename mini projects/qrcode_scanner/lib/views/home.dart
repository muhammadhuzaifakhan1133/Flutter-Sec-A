import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode_scanner/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 300,
              child: MobileScanner(
                allowDuplicates: false,
                onDetect: (barcode, args) {
                  if (barcode.rawValue != null) {
                    String code = barcode.rawValue!;
                    controller.code.value = code;
                  }
                },
              ),
            ),
            Center(child: codeView())
          ],
        ),
      ),
    );
  }

  Widget codeView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: Get.width * 0.7,
          child: InkWell(
            child: Obx(() => Text(controller.code.value)),
            onTap: () async {
              if (!await launchUrl(Uri.parse(controller.code.value),
                  mode: LaunchMode.externalApplication)) {
                Get.snackbar(
                  "Could not launch ${controller.code.value}",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.white,
                );
              }
            },
            onLongPress: () async {
              await Clipboard.setData(
                  ClipboardData(text: controller.code.value));
              Get.snackbar(
                "Copied to Clipboard",
                "",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.white,
              );
            },
          )),
    );
  }
}
