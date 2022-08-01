import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

productCardForBag({required Map<String, dynamic> data, required int index}) {
  return Card(
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(20),
      child: ListTile(
        leading: Image(image: AssetImage(data["productImage"][index])),
        title: Text(data["productName"][index], style: TextStyle(fontSize: 14)),
        subtitle: Text(data["productDesigner"][index],
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
        trailing: Text(
          "\$ ${(double.parse(data["price"][index]) * int.parse(data["qty"][index])).toStringAsFixed(2)}",
          style: TextStyle(
              color: themeColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
