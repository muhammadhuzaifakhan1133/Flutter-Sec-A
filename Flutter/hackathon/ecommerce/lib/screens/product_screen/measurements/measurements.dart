import 'package:ecommerce/constants/values.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_size_counters.dart';
import 'package:ecommerce/screens/product_screen/measurements/color_list_builder.dart';
import 'package:ecommerce/screens/product_screen/measurements/material_dropdown.dart';
import 'package:ecommerce/screens/product_screen/measurements/quantity_counter.dart';
import 'package:ecommerce/screens/product_screen/measurements/total_price_text.dart';
import 'package:flutter/material.dart';

class ProductMeasurements extends StatelessWidget {
  ProductMeasurements(
      {required this.price,
      required this.clothMeasurements,
      required this.colorsListSelected,
      required this.availableColors,
      Key? key})
      : super(key: key);
  double price;
  ClothMeasurements clothMeasurements;
  List<bool> colorsListSelected;
  List<String> availableColors;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            clothSizeCounters(clothMeasurements: clothMeasurements),
            const Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30),
              child: Text(
                "Color",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ColorListBuilder(
                size: size,
                availableColors: availableColors,
                colorsListSelected: colorsListSelected),
            SizedBox(height: 20),
            QuantityCounter(clothMeasurements: clothMeasurements),
            MaterialDropDown(
                clothMeasurements: clothMeasurements, materials: materials),
            totalPriceText(clothMeasurements: clothMeasurements, price: price),
          ],
        ),
      ),
    );
  }
}
