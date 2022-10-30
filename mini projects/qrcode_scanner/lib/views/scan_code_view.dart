import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode_scanner/constants/colors.dart';
import 'package:qrcode_scanner/controller/histroy_controller.dart';
import 'package:qrcode_scanner/controller/scan_code_controller.dart';
import 'package:qrcode_scanner/widgets/code_view_card.dart';

class ScanCodeView extends StatelessWidget {
  ScanCodeView({super.key});

  ScanCodeController controller = Get.put(ScanCodeController(), tag: "scan");
  HistoryController historyController =
      Get.put(HistoryController(), tag: "history");
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("QR Code Scanner")),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.4,
                child: MobileScanner(
                  allowDuplicates: false,
                  onDetect: (barcode, args) async {
                    if (barcode.rawValue != null &&
                        barcode.rawValue != controller.code.value) {
                      FlutterBeep.beep();
                      String code = barcode.rawValue!;
                      controller.code.value = code;
                      await historyController.writeHistory(code);
                    }
                  },
                ),
              ),
            ),
            textFieldToShowCode(getxController: controller),
            const SizedBox(height: 10),
            Obx(() => controller.code.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await controller.copyText();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          child: Text("Copy Text",
                              style: TextStyle(color: buttonTextColor)),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await controller.gotoWebsite();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor),
                          child: Text("Go to Website",
                              style: TextStyle(color: buttonTextColor)),
                        ),
                      ],
                    ),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}
