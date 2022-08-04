import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/bag/app_bar.dart';
import 'package:ecommerce/screens/bag/bottom_bar.dart';
import 'package:ecommerce/screens/bag/card_remove_icon.dart';
import 'package:ecommerce/screens/bag/dialog_to_remove_product.dart';
import 'package:ecommerce/screens/bag/go_to_update_order_screen.dart';
import 'package:ecommerce/screens/bag/product_card_for_bag.dart';
import 'package:ecommerce/screens/bag/total_price_bag_products.dart';
import 'package:ecommerce/screens/payment_successful/payment_successful.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
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
      bagProducts.totalPrice = await getTotalPriceOfBagProducts();
      Username = await getUserName(email: (user?.email)!);
      if (mounted) {
        setState(() {
          username = Username;
        });
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (username != null) {
      return Scaffold(
          appBar: bagScreenAppBar(
              username: username!, userPhotoUrl: user?.photoURL),
          bottomNavigationBar: bagScreenBottomBar(
              context: context,
              bagProducts: bagProducts,
              onPressedPayNow: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentSuccessful()));
                setState(() {
                  bagProducts.totalPrice = 0;
                  removeBagProducts();
                });
              }),
          body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: getBagProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  Map<String, dynamic> bagData =
                      snapshot.data as Map<String, dynamic>;
                  return ListView.builder(
                    itemCount: bagData["productID"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          InkWell(
                            child:
                                productCardForBag(data: bagData, index: index),
                            onTap: () async {
                              bool updateSuccess = await goToUpdateOrderScreen(
                                  context: context,
                                  data: bagData,
                                  index: index);
                              if (updateSuccess) {
                                circleProgressDialog(context);
                                double updateTotalPrice =
                                    await getTotalPriceOfBagProducts();
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
              )));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
