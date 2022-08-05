import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/Home/product_card/description.dart';
import 'package:ecommerce/screens/Home/product_card/designer_info.dart';
import 'package:ecommerce/screens/Home/product_card/favorite_icon.dart';
import 'package:ecommerce/screens/Home/product_card/keywords.dart';
import 'package:ecommerce/screens/Home/product_card/pics_arrangement.dart';
import 'package:ecommerce/screens/Home/product_card/share_info.dart';
import 'package:ecommerce/screens/Home/product_card/wishlist_info.dart';
import 'package:ecommerce/screens/product_screen/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatefulWidget {
  ProductCard(
      {required this.name,
      required this.productID,
      required this.designerImgPath,
      required this.designerName,
      required this.designerStatus,
      required this.isUserWishListProduct,
      required this.wishlistCount,
      required this.description,
      required this.materialsInfo,
      required this.washInstruction,
      required this.price,
      required this.availableColors,
      required this.imgPaths,
      required this.keywords,
      required this.shareCount,
      required this.isQueryNotGiven,
      Key? key})
      : super(key: key);
  String name;
  String productID;
  String designerImgPath;
  String designerName;
  String designerStatus;
  List<bool> isUserWishListProduct;
  int wishlistCount;
  String description;
  String materialsInfo;
  String washInstruction;
  double price;
  List<String> availableColors;
  List<dynamic> imgPaths;
  List<dynamic> keywords;
  int shareCount;
  bool isQueryNotGiven;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  changeFavoriteInHome() {
    setState(() {
      widget.isUserWishListProduct[0] = !widget.isUserWishListProduct[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      name: widget.name,
                      productDesigner: widget.designerName,
                      availableColors: widget.availableColors,
                      email: (user?.email)!,
                      imgPaths: widget.imgPaths,
                      isUserWishListProduct: widget.isUserWishListProduct[0],
                      productID: widget.productID,
                      materialsInfo: widget.materialsInfo,
                      washInstruction: widget.washInstruction,
                      price: widget.price,
                      onFavoriteChange: changeFavoriteInHome,
                    )));
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.isQueryNotGiven
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        designerInfo(
                            imgPath: widget.designerImgPath,
                            name: widget.designerName,
                            status: widget.designerStatus),
                        isProductUserWishList(
                            productID: widget.productID,
                            email: (user?.email)!,
                            isUserWishListProduct: widget.isUserWishListProduct,
                            wishlistCount: widget.wishlistCount),
                      ],
                    ),
                    const SizedBox(height: 10),
                    productDescription(description: widget.description),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: arrangementOfPics(widget.imgPaths),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productKeywords(widget.keywords),
                        productShareInfo(widget.shareCount)
                      ],
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(widget.imgPaths[0])),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ ${widget.price}",
                              style:
                                  TextStyle(color: themeColor, fontSize: 14)),
                          FavoriteIcon(
                              isUserWishListProduct:
                                  widget.isUserWishListProduct,
                              productID: widget.productID,
                              email: (user?.email)!)
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(widget.designerImgPath),
                        ),
                        Text(" ${widget.designerName}")
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
