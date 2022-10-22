import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/Home/home_screen.dart';
import 'package:ecommerce/screens/add/add_screen.dart';
import 'package:ecommerce/screens/bag/bag_screen.dart';
import 'package:ecommerce/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomBarController extends StatefulWidget {
  BottomBarController({this.query = "", Key? key}) : super(key: key);
  final String query;

  @override
  State<BottomBarController> createState() => _BottomBarControllerState();
}

class _BottomBarControllerState extends State<BottomBarController> {
  int index = 0;
  Future<bool> onWillPop() async {
    if (index != 0) {
      setState(() {
        index = 0;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(query: widget.query),
      const BagScreen(),
      const SettingScreen(),
      const AddScreen()
    ];
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel), label: "bag"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "setting"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
          ],
        ),
        body: screens[index],
      ),
    );
  }
}
