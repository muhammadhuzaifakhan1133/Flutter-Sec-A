import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/product_screen/measurements/measurements.dart';
import 'package:ecommerce/screens/update_bag_data/app_bar.dart';
import 'package:ecommerce/screens/update_bag_data/cancel_button.dart';
import 'package:ecommerce/screens/update_bag_data/product_info.dart';
import 'package:ecommerce/screens/update_bag_data/update_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateBagData extends StatelessWidget {
  UpdateBagData(
      {required this.index,
      required this.productID,
      required this.image,
      required this.name,
      required this.designer,
      required this.price,
      required this.clothMeasurements,
      required this.colorsListSelected,
      required this.availableColors,
      Key? key})
      : super(key: key);
  int index;
  String productID;

  String image;
  String name;
  String designer;
  double price;
  ClothMeasurements clothMeasurements;
  List<bool> colorsListSelected;
  List<String> availableColors;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: updateOrderSceenAppBar(context),
      body: Column(
        children: [
          productInformation(
              image: image, designer: designer, name: name, price: price),
          Divider(thickness: 2),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ProductMeasurements(
                price: price,
                clothMeasurements: clothMeasurements,
                colorsListSelected: colorsListSelected,
                availableColors: availableColors),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cancelButton(context),
              updateButton(
                  context: context,
                  email: (user?.email)!,
                  index: index,
                  productID: productID,
                  clothMeasurements: clothMeasurements,
                  availableColors: availableColors,
                  colorsListSelected: colorsListSelected)
            ],
          )
        ],
      ),
    );
  }
}
