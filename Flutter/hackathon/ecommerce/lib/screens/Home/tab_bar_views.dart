import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/Home/product_builder.dart';
import 'package:flutter/material.dart';

TabBarView tabBarView({required String query}) {
  return TabBarView(
    physics: BouncingScrollPhysics(),
    children: [
      ProductBuilder(collection: "women", query: query),
      ProductBuilder(
        collection: "men",
        query: query,
      ),
      ProductBuilder(
        collection: "children",
        query: query,
      ),
    ],
  );
}
