import 'package:education/controllers/BottomBarController/bottom_bar_controller.dart';
import 'package:education/views/category/category_view.dart';
import 'package:education/views/home/icon_for_home.dart';
import 'package:education/views/home/top_bar.dart';
import 'package:education/widgets.dart/category_card.dart';
import 'package:education/widgets.dart/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomBottomBarController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            topBar(),
            SizedBox(height: 30),
            customTextField(
                context: context,
                hintText: "Search your course..",
                radius: 15,
                widthPercent: 0.85,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconForHome(icon: Icons.code, label: "Coding"),
                    iconForHome(icon: Icons.design_services, label: "Design"),
                    iconForHome(
                        icon: Icons.maps_home_work_outlined,
                        label: "Marketing"),
                    iconForHome(icon: Icons.business, label: "Business"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconForHome(
                        icon: Icons.emoji_people_sharp, label: "Lifestyle"),
                    iconForHome(icon: Icons.music_note, label: "Music"),
                    iconForHome(icon: Icons.book, label: "Academics"),
                    iconForHome(icon: Icons.more, label: "More"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Continue Your Lessons",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeIndex(1);
                    },
                    child: Text(
                      "see all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            categoryCard(size:size),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation Course",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeIndex(1);
                    },
                    child: Text(
                      "see all",
                      style: TextStyle(color: Colors.teal),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
