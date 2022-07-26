import 'package:ecommerce/screens/product_screen/product_screen.dart';
import 'package:ecommerce/widgets/product_card/description.dart';
import 'package:ecommerce/widgets/product_card/designer_info.dart';
import 'package:ecommerce/widgets/product_card/wishlist_info.dart';
import 'package:ecommerce/widgets/product_card/keywords.dart';
import 'package:ecommerce/widgets/product_card/pics_arrangement.dart';
import 'package:ecommerce/widgets/product_card/share_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget productCard(
    {required BuildContext context,
    required String productID,
    required String designerImgPath,
    required String designerName,
    required String designerStatus,
    required bool isUserWishListProduct,
    required int wishlistCount,
    required String description,
    required String materialsInfo,
    required String washInstruction,
    required double price,
    required List<dynamic> imgPaths,
    required List<dynamic> keywords,
    required int shareCount}) {
  User? user = FirebaseAuth.instance.currentUser;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      email: (user?.email)!,
                      imgPaths: imgPaths,
                      isUserWishListProduct: isUserWishListProduct,
                      productID: productID,
                      materialsInfo: materialsInfo,
                      washInstruction: washInstruction,
                      price: price,
                    )));
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  designerInfo(
                      imgPath: designerImgPath,
                      name: designerName,
                      status: designerStatus),
                  isProductUserWishList(
                      productID: productID,
                      email: (user?.email)!,
                      isUserWishListProduct: isUserWishListProduct,
                      wishlistCount: wishlistCount),
                ],
              ),
              const SizedBox(height: 10),
              productDescription(description: description),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: arrangementOfPics(imgPaths),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  productKeywords(keywords),
                  productShareInfo(shareCount)
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
