import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

TabBar tabBar() {
  return TabBar(
    indicatorColor: themeColor,
    indicatorWeight: 4,
    unselectedLabelColor: Colors.grey,
    labelColor: Colors.black,
    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    tabs: const [
      Tab(text: "Women"),
      Tab(text: "Men"),
      Tab(text: "Children"),
    ],
  );
}
