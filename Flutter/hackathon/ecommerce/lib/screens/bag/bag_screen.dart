import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/update_bag_data/update_bag_data.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  double totalPrice = 0;
  String? username;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String Username;
    (() async {
      totalPrice = await getTotalPriceOfBagProducts(email: (user?.email)!);
      Username = await getUserName(email: (user?.email)!);
      setState(() {
        username = Username;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (username != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: profileAvatar(
                  userName: username!, userPhotoUrl: user?.photoURL),
            )
          ],
        ),
        bottomNavigationBar:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Total ",
                  style: TextStyle(color: Colors.grey, fontSize: 22)),
              TextSpan(
                  text: "\$ ${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: themeColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))
            ]),
          ),
          buttonWidget(
              size: MediaQuery.of(context).size,
              text: "Pay Now",
              buttonColor: themeColor,
              widthPercent: 0.5,
              radius: 5,
              heightPercent: 0.07,
              onpressed: () {}),
        ]),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("bag")
                .doc(user?.email)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> bagData =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ListView.builder(
                itemCount: bagData["productID"].length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("products")
                        .doc(bagData["productID"][index])
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot2) {
                      if (snapshot2.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox();
                      }
                      Map<String, dynamic> productData =
                          snapshot2.data!.data() as Map<String, dynamic>;

                      return FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection("designers")
                            .doc(productData["designer"])
                            .get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot3) {
                          if (snapshot3.hasError) {
                            return const Center(
                                child: Text("Something went wrong"));
                          }
                          if (snapshot3.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          }
                          Map<String, dynamic> designerData =
                              snapshot3.data!.data() as Map<String, dynamic>;
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () async {
                                  ClothMeasurements clothMeasurements =
                                      ClothMeasurements(
                                          waist: bagData["waist"][index],
                                          breadth: bagData["breadth"][index],
                                          length: bagData["length"][index],
                                          material: bagData["material"][index],
                                          qty: bagData["qty"][index]);
                                  List<String> availableColors =
                                      List<String>.from(
                                          productData["availableColors"]);
                                  List<bool> colorsListSelected = List.generate(
                                      availableColors.length, (index) => false);
                                  colorsListSelected[availableColors
                                      .indexOf(bagData["color"][index])] = true;
                                  bool updateSuccess = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateBagData(
                                              productID: bagData["productID"]
                                                  [index],
                                              index: index,
                                              image: productData["imgPaths"][0],
                                              name: productData["name"],
                                              designer: designerData["name"],
                                              price: productData["price"],
                                              clothMeasurements:
                                                  clothMeasurements,
                                              colorsListSelected:
                                                  colorsListSelected,
                                              availableColors:
                                                  availableColors)));
                                  if (updateSuccess) {
                                    circleProgressDialog(context);
                                    double updateTotalPrice =
                                        await getTotalPriceOfBagProducts(
                                            email: (user?.email)!);
                                    closeDialog(context);
                                    setState(() {
                                      totalPrice = updateTotalPrice;
                                    });
                                  }
                                },
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              productData["imgPaths"][0])),
                                      title: Text(productData["name"],
                                          style: TextStyle(fontSize: 14)),
                                      subtitle: Text(designerData["name"],
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                      trailing: Text(
                                        "\$ ${(productData["price"] * bagData["qty"][index]).toStringAsFixed(2)}",
                                        style: TextStyle(
                                            color: themeColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text("Remove product",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                content: Text(
                                                    "Are you sure you want to remove this product from your bag"),
                                                actions: [
                                                  TextButton(
                                                    child: Text("No"),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    child: Text("Yes"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.red),
                                                    onPressed: () async {
                                                      circleProgressDialog(
                                                          context);
                                                      await removeProductFromBag(
                                                          context: context,
                                                          email: (user?.email)!,
                                                          index: index);
                                                      double updatedTotalPrice =
                                                          await getTotalPriceOfBagProducts(
                                                              email: (user
                                                                  ?.email)!);
                                                      setState(() {
                                                        totalPrice =
                                                            updatedTotalPrice;
                                                      });
                                                      closeDialog(context);
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              ));
                                    },
                                    icon:
                                        Icon(Icons.close, color: Colors.grey)),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
