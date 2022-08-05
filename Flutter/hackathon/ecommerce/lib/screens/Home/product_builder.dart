import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/Home/product_card/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatelessWidget {
  ProductBuilder({required this.collection, required this.query, Key? key})
      : super(key: key);
  String collection;
  String query;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("wishlist")
                .doc((user?.email)!)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot0) {
              if (snapshot0.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (snapshot0.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> wishList =
                  snapshot0.data!.data() as Map<String, dynamic>;
              List<dynamic> wishListProductIds = wishList["productID"];
              return FutureBuilder(
                future: query.isNotEmpty
                    ? FirebaseFirestore.instance
                        .collection("products")
                        .where("collection", isEqualTo: collection)
                        .where("keywords", arrayContains: query)
                        .get()
                    : FirebaseFirestore.instance
                        .collection("products")
                        .where("collection", isEqualTo: collection)
                        .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot1) {
                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        query.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Text(
                                    "${snapshot1.data!.docs.length} items found for '$query'",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                              )
                            : SizedBox(),
                        GridView.count(
                            mainAxisSpacing: 8,
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.all(8),
                            crossAxisCount: query.isEmpty ? 1 : 2,
                            childAspectRatio: query.isEmpty ? 0.75 : 0.58,
                            children: snapshot1.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection("designers")
                                    .doc(data["designer"])
                                    .get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot2) {
                                  if (snapshot2.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox();
                                  }
                                  Map<String, dynamic> designerData =
                                      snapshot2.data!.data()
                                          as Map<String, dynamic>;
                                  return ProductCard(
                                      name: data["name"],
                                      productID: document.id,
                                      designerImgPath: designerData["imgPath"],
                                      availableColors: List<String>.from(
                                          data["availableColors"]),
                                      designerName: designerData["name"],
                                      designerStatus: designerData["status"],
                                      isUserWishListProduct: [
                                        wishListProductIds.contains(document.id)
                                      ],
                                      wishlistCount: data["favoriteCount"],
                                      description: data["info"]["description"],
                                      imgPaths: data["imgPaths"],
                                      keywords: data["keywords"],
                                      shareCount: data["shareCount"],
                                      materialsInfo: data["info"]["materials"],
                                      washInstruction: data["info"]
                                          ["washInstructions"],
                                      price: data["price"],
                                      isQueryNotGiven: query.isEmpty);
                                },
                              );
                            }).toList()),
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
