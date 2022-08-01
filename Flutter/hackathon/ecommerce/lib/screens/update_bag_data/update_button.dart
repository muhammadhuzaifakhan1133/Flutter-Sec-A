import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

updateButton(
    {required BuildContext context,
    required String email,
    required int index,
    required String productID,
    required ClothMeasurements clothMeasurements,
    required List<String> availableColors,
    required List<bool> colorsListSelected}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: themeColor),
        onPressed: () async {
          circleProgressDialog(context);
          await updateBagProduct(
              index: index,
              breadth: clothMeasurements.breadth,
              waist: clothMeasurements.waist,
              length: clothMeasurements.length,
              color: availableColors[colorsListSelected.indexOf(true)],
              material: clothMeasurements.material,
              qty: clothMeasurements.qty);
          closeDialog(context);
          Navigator.pop(context, true);
        },
        child: Text("Update")),
  );
}
