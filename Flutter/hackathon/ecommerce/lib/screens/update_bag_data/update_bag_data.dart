import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/product_screen/measurements/measurements.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Update Order", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image(image: AssetImage(image)),
            title: Text(name),
            subtitle: Text(designer),
            trailing: Text(
              "\$ $price",
              style: TextStyle(color: themeColor),
            ),
          ),
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: themeColor),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("Cancle")),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: themeColor),
                    onPressed: () async {
                      circleProgressDialog(context);
                      await updateBagProduct(
                          email: (user?.email)!,
                          index: index,
                          productID: productID,
                          breadth: clothMeasurements.breadth,
                          waist: clothMeasurements.waist,
                          length: clothMeasurements.length,
                          color:
                              availableColors[colorsListSelected.indexOf(true)],
                          material: clothMeasurements.material,
                          qty: clothMeasurements.qty);
                      closeDialog(context);
                      Navigator.pop(context, true);
                    },
                    child: Text("Update")),
              )
            ],
          )
        ],
      ),
    );
  }
}
