import 'package:counter/counter.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:flutter/material.dart';

Padding quantityCounter(
    {required setState, required ClothMeasurements clothMeasurements}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0, left: 30),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text("Quantity", style: TextStyle(fontSize: 18)),
        ),
        Counter(
          min: 1,
          max: 10000000,
          initial: clothMeasurements.qty,
          onValueChanged: (num value) {
            Future.delayed(Duration.zero, () {
              setState(() {
                clothMeasurements.qty = value.toInt();
              });
            });
          },
        ),
      ],
    ),
  );
}
