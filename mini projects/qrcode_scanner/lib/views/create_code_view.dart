import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_scanner/controller/create_code_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreateCodeView extends StatelessWidget {
  CreateCodeView({super.key});
  TextEditingController textEditingController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  CreateCodeController controller = CreateCodeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Generator")),
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
              SizedBox(height: 30),
              Container(
                  width: Get.width * 0.8,
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter text to generate code",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15))),
                    maxLines: 5,
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.isEmpty) {
                        Fluttertoast.cancel();
                        Fluttertoast.showToast(msg: "No Text Found");
                        return;
                      }
                      controller.data.value = textEditingController.text;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                    child: const Text("Generate"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (controller.data.value.isEmpty) {
                        Fluttertoast.cancel();
                        Fluttertoast.showToast(msg: "No QR Code Found");
                        return;
                      }
                      Uint8List? image = await screenshotController.capture();
                      final Directory directory =
                          (await getApplicationDocumentsDirectory());
                      DateTime date = DateTime.now();
                      final String filename =
                          "${date.toString().split(" ")[0]}-${date.hour}-${date.minute}-${date.second}-${date.microsecond}.png";
                      final File imagePath =
                          await File("${directory.path}/${filename}").create();
                      await imagePath.writeAsBytes(fileToBytes(image));
                      await Share.shareFiles([imagePath.path]);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                    child: const Text("Download Image"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
