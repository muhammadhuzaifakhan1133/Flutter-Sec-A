import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    return Scaffold(
      body: Obx(() => controller.views[controller.viewCurrentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner), label: "Scan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.create), label: "Create"),
            ],
            currentIndex: controller.viewCurrentIndex.value,
            onTap: (int value) {
              controller.viewCurrentIndex.value = value;
            },
            selectedItemColor: Colors.amber[800],
          )),
    );
  }
}
