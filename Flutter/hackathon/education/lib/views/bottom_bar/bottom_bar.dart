import 'package:education/controllers/BottomBarController/bottom_bar_controller.dart';
import 'package:education/views/category/category_view.dart';
import 'package:education/views/favorite/favorite_lesson.dart';
import 'package:education/views/home/home_view.dart';
import 'package:education/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);
  List<Widget> screens = const [
    HomeView(),
    CategoryView(),
    Favorite(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    CustomBottomBarController controller = Get.put(CustomBottomBarController());
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              showSelectedLabels: false,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.teal,
              currentIndex: controller.index.value,
              onTap: (currentIndex) {
                controller.changeIndex(currentIndex);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_collection_outlined),
                    label: "Video"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ])),
      body: Obx(() => screens[controller.index.value]),
    );
  }
}
