import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/bag/app_bar.dart';
import 'package:ecommerce/screens/bag/bottom_bar.dart';
import 'package:ecommerce/screens/bag/card_remove_icon.dart';
import 'package:ecommerce/screens/bag/dialog_to_remove_product.dart';
import 'package:ecommerce/screens/bag/go_to_update_order_screen.dart';
import 'package:ecommerce/screens/bag/product_card_for_bag.dart';
import 'package:ecommerce/screens/bag/total_price_bag_products.dart';
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
  TotalPriceBagProducts bagProducts = TotalPriceBagProducts();
  String? username;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String Username;
    (() async {
      bagProducts.totalPrice =
          await getTotalPriceOfBagProducts(email: (user?.email)!);
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
        appBar:
            bagScreenAppBar(username: username!, userPhotoUrl: user?.photoURL),
        bottomNavigationBar:
            bagScreenBottomBar(context: context, bagProducts: bagProducts),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("bag")
                .doc(user?.email)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> bagSnapshot) {
              if (bagSnapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (bagSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> bagData =
                  bagSnapshot.data!.data() as Map<String, dynamic>;
              return ListView.builder(
                itemCount: bagData["productID"].length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("products")
                        .doc(bagData["productID"][index])
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> productSnapshot) {
                      if (productSnapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      if (productSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox();
                      }
                      Map<String, dynamic> productData =
                          productSnapshot.data!.data() as Map<String, dynamic>;

                      return FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection("designers")
                            .doc(productData["designer"])
                            .get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> designerSnapshot) {
                          if (designerSnapshot.hasError) {
                            return const Center(
                                child: Text("Something went wrong"));
                          }
                          if (designerSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          }
                          Map<String, dynamic> designerData =
                              designerSnapshot.data!.data()
                                  as Map<String, dynamic>;
                          return Stack(
                            children: [
                              InkWell(
                                child: productCardForBag(
                                    productData: productData,
                                    designerData: designerData,
                                    bagData: bagData,
                                    index: index),
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  bool updateSuccess =
                                      await goToUpdateOrderScreen(
                                          context: context,
                                          bagData: bagData,
                                          productData: productData,
                                          designerData: designerData,
                                          index: index);
                                  if (updateSuccess) {
                                    circleProgressDialog(context);
                                    double updateTotalPrice =
                                        await getTotalPriceOfBagProducts(
                                            email: (user?.email)!);
                                    closeDialog(context);
                                    setState(() {
                                      bagProducts.totalPrice = updateTotalPrice;
                                    });
                                  }
                                },
                              ),
                              cardRemoveIcon(
                                  setState: setState,
                                  context: context,
                                  email: (user?.email)!,
                                  index: index,
                                  bagProducts: bagProducts)
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
