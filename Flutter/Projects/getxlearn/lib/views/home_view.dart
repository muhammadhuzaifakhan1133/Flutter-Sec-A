import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearn/controller/home_controller.dart';
import 'package:getxlearn/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text("${homeController.counter.value}");
            }),
            ElevatedButton(
                onPressed: () {
                  homeController.addValue();
                },
                child: Text("Add")),
            ElevatedButton(
                onPressed: () {
                  Get.to(Profile());
                },
                child: Text("Go to Profile"))
          ],
        ),
      ),
    );
  }
}
