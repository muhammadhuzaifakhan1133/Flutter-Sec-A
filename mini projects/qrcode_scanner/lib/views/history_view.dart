import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcode_scanner/constants/colors.dart';
import 'package:qrcode_scanner/controller/histroy_controller.dart';
import 'package:qrcode_scanner/widgets/delete_dialog.dart';
import 'package:qrcode_scanner/widgets/get_childrens_of_expansion_tile.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  HistoryController controller = Get.find(tag: "history");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("History")),
          backgroundColor: appBarColor,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Obx(() => Text(controller.initiallyExpanded.value
                        ? "Collpase"
                        : "Expand")),
                    onTap: () {
                      controller.initiallyExpanded.value =
                          !(controller.initiallyExpanded.value);
                    }),
                PopupMenuItem(
                  child: Text("Delete all history"),
                  onTap: () async {
                    controller.keys.value = [];
                    controller.keysWithValues.value = {};
                    await controller.box.erase();
                  },
                ),
              ],
            )
          ],
        ),
        body: Obx(
          () => controller.keys.length != 0
              ? ListView.builder(
                  itemCount: controller.keys.length,
                  itemBuilder: (context, index) {
                    String key = controller.keys[index];
                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onLongPress: () {
                            deleteDialog(controller, key,
                                title: "Delete",
                                middleText:
                                    "Are you sure to delete all history of this date?");
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Obx(
                              () => ExpansionTile(
                                  key: GlobalKey(),
                                  initiallyExpanded:
                                      controller.initiallyExpanded.value,
                                  title: Text(key),
                                  iconColor: Colors.black,
                                  textColor: Colors.black,
                                  leading: Icon(Icons.date_range_outlined),
                                  children: getChildrensOfExpansionTile(
                                      key, controller)),
                            ),
                          ),
                        ));
                  },
                )
              : Center(
                  child: Container(
                  width: Get.width * 0.7,
                  child: Text(
                    "No History found! Scan QR Codes to generate history",
                    textAlign: TextAlign.center,
                  ),
                )),
        ));
  }
}
