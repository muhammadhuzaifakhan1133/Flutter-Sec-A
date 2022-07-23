import 'package:ecommerce/screens/Home/men_collection/men_collection.dart';
import 'package:ecommerce/screens/Home/women_collection/women_collection.dart';
import 'package:flutter/material.dart';

TabBarView tabBarView() {
  return const TabBarView(
    physics: BouncingScrollPhysics(),
    children: [
      WomenCollection(),
      MenCollection(),
      Center(
        child: Text("Children Collection"),
      ),
    ],
  );
}
