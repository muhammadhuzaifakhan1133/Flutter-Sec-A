import 'package:ecommerce/screens/Home/women_collection/women_collection.dart';
import 'package:flutter/material.dart';

TabBarView tabBarView() {
  return const TabBarView(
    physics: BouncingScrollPhysics(),
    children: [
      WomenCollection(),
      Center(
        child: Text("Men Collection"),
      ),
      Center(
        child: Text("Children Collection"),
      ),
    ],
  );
}
