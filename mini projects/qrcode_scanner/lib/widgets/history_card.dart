import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/controller/scan_code_controller.dart';

historyCard({controller, index}) {
  ScanCodeController scanController = Get.find(tag: "scan");
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Obx(() => ExpansionTile(
            initiallyExpanded: true,
            childrenPadding: EdgeInsets.only(left: 10, right: 10),
            leading: Icon(Icons.date_range),
            textColor: Colors.black,
            iconColor: Colors.black,
            title: Text(controller.dates.elementAt(index),
                style: TextStyle(fontWeight: FontWeight.bold)),
            children:
                controller.datesWithValues[controller.dates.elementAt(index)]!
                    .map((text) => ListTile(
                          title: Text(text, overflow: TextOverflow.ellipsis),
                          dense: true,
                          trailing: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {
                              scanController.copyText(text: text);
                            },
                          ),
                          onTap: () {
                            scanController.gotoWebsite(text: text);
                          },
                          onLongPress: () {
                            Get.defaultDialog(
                                title: "Delete?",
                                onConfirm: () async {
                                  controller.datesWithValues[
                                          controller.dates.elementAt(index)]!
                                      .remove(text);
                                  // await controller.deleteHistory(
                                  //     key: controller
                                  //         .valuesWithKey[text]!,
                                  //     value: text);
                                  Get.back();
                                });
                          },
                        ))
                    .toList(),
          )),
    ),
  );
}
