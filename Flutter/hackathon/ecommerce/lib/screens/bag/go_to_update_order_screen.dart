import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/update_bag_data/update_bag_data.dart';
import 'package:flutter/material.dart';

Future<bool> goToUpdateOrderScreen({
  required BuildContext context,
  required Map<String, dynamic> data,
  required int index,
}) async {
  ClothMeasurements clothMeasurements = ClothMeasurements(
      waist: int.parse(data["waist"][index]),
      breadth: int.parse(data["breadth"][index]),
      length: int.parse(data["length"][index]),
      material: data["material"][index],
      qty: int.parse(data["qty"][index]));
  List<String> availableColors =
      await getAvailableColors(data["productID"][index]);
  List<bool> colorsListSelected =
      List.generate(availableColors.length, (index) => false);
  colorsListSelected[availableColors.indexOf(data["color"][index])] = true;
  // ignore: use_build_context_synchronously
  bool updateSuccess = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UpdateBagData(
              productID: data["productID"][index],
              index: index,
              image: data["productImage"][index],
              name: data["productName"][index],
              designer: data["productDesigner"][index],
              price: double.parse(data["price"][index]),
              clothMeasurements: clothMeasurements,
              colorsListSelected: colorsListSelected,
              availableColors: availableColors)));
  return updateSuccess;
}
