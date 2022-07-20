import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/Home/home_screen.dart';
import 'package:ecommerce/screens/add/add_screen.dart';
import 'package:ecommerce/screens/bag/bag_screen.dart';
import 'package:ecommerce/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int index = 0;
  List<Widget> screens = [
    HomeScreen(),
    BagScreen(),
    SettingScreen(),
    AddScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: themeColor,
        currentIndex: index,
        onTap: (currentIndex) {
          setState(() {
            index = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "bag"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
        ],
      ),
      body: screens[index],
    );
  }
}
