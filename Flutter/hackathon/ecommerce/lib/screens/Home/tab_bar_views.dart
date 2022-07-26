import 'package:ecommerce/screens/Home/product_builder.dart';
import 'package:flutter/material.dart';

TabBarView tabBarView() {
  return TabBarView(
    physics: BouncingScrollPhysics(),
    children: [
      ProductBuilder(collection: "women"),
      ProductBuilder(collection: "men"),
      ProductBuilder(collection: "children"),
    ],
  );
}
