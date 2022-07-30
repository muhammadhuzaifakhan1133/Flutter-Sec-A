import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

ListTile productInformation(
    {required String image,
    required String name,
    required String designer,
    required double price}) {
  return ListTile(
    leading: Image(image: AssetImage(image)),
    title: Text(name),
    subtitle: Text(designer),
    trailing: Text(
      "\$ $price",
      style: TextStyle(color: themeColor),
    ),
  );
}
