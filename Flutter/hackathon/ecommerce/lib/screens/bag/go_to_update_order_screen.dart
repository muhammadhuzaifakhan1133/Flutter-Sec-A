import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/update_bag_data/update_bag_data.dart';
import 'package:flutter/material.dart';

Future<bool> goToUpdateOrderScreen({
  required BuildContext context,
  required Map<String, dynamic> bagData,
  required Map<String, dynamic> productData,
  required Map<String, dynamic> designerData,
  required int index,
}) async {
  ClothMeasurements clothMeasurements = ClothMeasurements(
      waist: bagData["waist"][index],
      breadth: bagData["breadth"][index],
      length: bagData["length"][index],
      material: bagData["material"][index],
      qty: bagData["qty"][index]);
  List<String> availableColors =
      List<String>.from(productData["availableColors"]);
  List<bool> colorsListSelected =
      List.generate(availableColors.length, (index) => false);
  colorsListSelected[availableColors.indexOf(bagData["color"][index])] = true;
  bool updateSuccess = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UpdateBagData(
              productID: bagData["productID"][index],
              index: index,
              image: productData["imgPaths"][0],
              name: productData["name"],
              designer: designerData["name"],
              price: productData["price"],
              clothMeasurements: clothMeasurements,
              colorsListSelected: colorsListSelected,
              availableColors: availableColors)));
  return updateSuccess;
}
