import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/Home/home_screen.dart';
import 'package:ecommerce/screens/add/add_screen.dart';
import 'package:ecommerce/screens/bag/bag_screen.dart';
import 'package:ecommerce/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomBarController extends StatefulWidget {
  BottomBarController({this.query = "", Key? key}) : super(key: key);
  String query;

  @override
  State<BottomBarController> createState() => _BottomBarControllerState();
}

class _BottomBarControllerState extends State<BottomBarController> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(query: widget.query),
      BagScreen(),
      SettingScreen(),
      AddScreen()
    ];
    Size size = MediaQuery.of(context).size;
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
        items: const [
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
