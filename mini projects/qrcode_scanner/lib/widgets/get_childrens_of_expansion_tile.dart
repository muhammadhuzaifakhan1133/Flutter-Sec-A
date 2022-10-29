import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/constants/colors.dart';
import 'package:qrcode_scanner/controller/histroy_controller.dart';
import 'package:qrcode_scanner/controller/scan_code_controller.dart';
import 'package:qrcode_scanner/widgets/delete_dialog.dart';

List<Widget> getChildrensOfExpansionTile(
    String key, HistoryController controller) {
  ScanCodeController scanCodeController = ScanCodeController();
  List<Widget> childrens = [];
  for (var i = 0; i < controller.keysWithValues[key].length; i++) {
    childrens.add(ListTile(
      dense: true,
      title: Text(
        controller.keysWithValues[key][i],
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () async {
        scanCodeController.gotoWebsite(text: controller.keysWithValues[key][i]);
      },
      onLongPress: () {
        deleteDialog(controller, key,
            index: i,
            title: "Delete?",
            middleText: "Are you sure to delete this history item?");
      },
      trailing: IconButton(
        icon: Icon(Icons.copy),
        onPressed: () {
          scanCodeController.copyText(text: controller.keysWithValues[key][i]);
        },
      ),
    ));
  }
  return childrens;
}
