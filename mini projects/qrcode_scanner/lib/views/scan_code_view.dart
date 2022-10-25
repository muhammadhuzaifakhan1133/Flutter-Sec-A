import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode_scanner/controller/scan_code_controller.dart';
import 'package:qrcode_scanner/functions/on_copy_text.dart';
import 'package:qrcode_scanner/functions/on_go_to_website.dart';
import 'package:qrcode_scanner/widgets/code_view_card.dart';

class ScanCodeView extends StatelessWidget {
  ScanCodeView({super.key});

  ScanCodeController controller = ScanCodeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Scanner")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.4,
                child: MobileScanner(
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue != null) {
                      FlutterBeep.beep();
                      String code = barcode.rawValue!;
                      controller.code.value = code;
                    }
                  },
                ),
              ),
            ),
            codeViewCard(getxController: controller),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await onCopyText(codeValue: controller.code.value);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  child: const Text("Copy Text"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await onGotoWebsite(codeValue: controller.code.value);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  child: const Text("Go to Website"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
