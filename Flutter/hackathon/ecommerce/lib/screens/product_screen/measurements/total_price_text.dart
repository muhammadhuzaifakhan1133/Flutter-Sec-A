import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:flutter/material.dart';

Padding totalPriceText({required ClothMeasurements clothMeasurements, price}) {
  return Padding(
    padding: const EdgeInsets.only(left: 32.0, top: 30, bottom: 30),
    child: Row(
      children: [
        Text("Total:", style: TextStyle(fontSize: 18)),
        Text(
          " \$ ${(clothMeasurements.qty * price).toStringAsFixed(2)}",
          style: TextStyle(
              color: themeColor, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
