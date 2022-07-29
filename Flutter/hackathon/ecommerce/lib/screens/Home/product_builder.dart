import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/widgets/product_card/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatefulWidget {
  ProductBuilder({required this.collection, Key? key}) : super(key: key);
  String collection;

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("wishlist")
                .doc((user?.email)!)
                .snapshots(),
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
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .where("collection", isEqualTo: widget.collection)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot1) {
                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                      children:
                          snapshot1.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("designers")
                          .doc(data["designer"])
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot2) {
                        if (snapshot2.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        }
                        Map<String, dynamic> designerData =
                            snapshot2.data!.data() as Map<String, dynamic>;
                        return productCard(
                            context: context,
                            name: data["name"],
                            productID: document.id,
                            designerImgPath: designerData["imgPath"],
                            availableColors:
                                List<String>.from(data["availableColors"]),
                            designerName: designerData["name"],
                            designerStatus: designerData["status"],
                            isUserWishListProduct:
                                wishListProductIds.contains(document.id),
                            wishlistCount: data["favoriteCount"],
                            description: data["info"]["description"],
                            imgPaths: data["imgPaths"],
                            keywords: data["keywords"],
                            shareCount: data["shareCount"],
                            materialsInfo: data["info"]["materials"],
                            washInstruction: data["info"]["washInstructions"],
                            price: data["price"]);
                      },
                    );
                  }).toList());
                },
              );
            }));
  }
}
