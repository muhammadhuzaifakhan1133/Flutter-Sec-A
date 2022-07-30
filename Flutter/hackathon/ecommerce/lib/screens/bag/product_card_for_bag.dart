import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

productCardForBag(
    {required Map<String, dynamic> productData,
    required Map<String, dynamic> designerData,
    required Map<String, dynamic> bagData,
    required int index}) {
  return Card(
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(20),
      child: ListTile(
        leading: Image(image: AssetImage(productData["imgPaths"][0])),
        title: Text(productData["name"], style: TextStyle(fontSize: 14)),
        subtitle: Text(designerData["name"],
            style: TextStyle(fontSize: 13, color: Colors.grey)),
        trailing: Text(
          "\$ ${(productData["price"] * bagData["qty"][index]).toStringAsFixed(2)}",
          style: TextStyle(
              color: themeColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
