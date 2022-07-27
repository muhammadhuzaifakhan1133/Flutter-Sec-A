import 'package:counter/counter.dart';
import 'package:ecommerce/screens/product_screen/cloth_size.dart';
import 'package:flutter/material.dart';

Row clothSizeCounters({required ClothSize clothSize}) {
  TextStyle counterLabelStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 11);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          Text("WAIST", style: counterLabelStyle),
          SizedBox(height: 15),
          Counter(
            min: 5,
            max: 1000,
            initial: 43,
            onValueChanged: (num value) {
              clothSize.waist = value.toInt();
            },
          ),
        ],
      ),
      Column(
        children: [
          Text("LENGTH", style: counterLabelStyle),
          SizedBox(height: 15),
          Counter(
            min: 5,
            max: 1000,
            initial: 34,
            onValueChanged: (num value) {
              clothSize.length = value.toInt();
            },
          ),
        ],
      ),
      Column(
        children: [
          Text("BREADTH", style: counterLabelStyle),
          SizedBox(height: 15),
          Counter(
            min: 5,
            max: 1000,
            initial: 76,
            onValueChanged: (num value) {
              clothSize.breadth = value.toInt();
            },
          ),
        ],
      ),
    ],
  );
}
