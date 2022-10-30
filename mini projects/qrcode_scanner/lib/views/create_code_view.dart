import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_scanner/constants/colors.dart';
import 'package:qrcode_scanner/controller/create_code_controller.dart';
import 'package:screenshot/screenshot.dart';

class CreateCodeView extends StatelessWidget {
  CreateCodeView({super.key});

  TextEditingController textEditingController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  CreateCodeController controller = CreateCodeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("QR Code Generator")),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.4,
                  child: Card(
                      elevation: 10,
                      child: Obx(() => controller.data.isNotEmpty
                          ? Screenshot(
                              controller: screenshotController,
                              child: QrImage(
                                data: controller.data.value,
                                version: QrVersions.auto,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                size: 200,
                              ),
                            )
                          : Container())),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  width: Get.width * 0.8,
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter text to generate code",
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15))),
                    maxLines: 5,
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.generateQrCode(textEditingController.text);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    child: Text("Generate",
                        style: TextStyle(color: buttonTextColor)),
                  ),
                  Obx(() => controller.data.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller
                                  .shareQrCode(screenshotController);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor),
                            child: Text("Share QR Code",
                                style: TextStyle(color: buttonTextColor)),
                          ),
                        )
                      : Container()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
