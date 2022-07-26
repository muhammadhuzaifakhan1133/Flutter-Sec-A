import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/render_slide_img.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen(
      {required this.imgPaths,
      required this.isUserWishListProduct,
      required this.email,
      required this.productID,
      Key? key})
      : super(key: key);
  List<dynamic> imgPaths;
  String email;
  String productID;
  bool isUserWishListProduct;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: IntroSlider(
                  showDoneBtn: false,
                  showNextBtn: false,
                  showPrevBtn: false,
                  showSkipBtn: false,
                  showDotIndicator: true,
                  colorDot: Colors.grey,
                  colorActiveDot: themeColor,
                  sizeDot: 10,
                  listCustomTabs:
                      renderProductImgSlides(imgPaths: widget.imgPaths),
                ),
              ),
              Positioned(
                left: 0,
                top: 10,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          widget.isUserWishListProduct
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.isUserWishListProduct
                              ? Colors.red
                              : Colors.black,
                        ),
                        onPressed: () {
                          if (widget.isUserWishListProduct) {
                            removeFromUserWishList(
                                email: widget.email,
                                productID: widget.productID);
                            setState(() {
                              widget.isUserWishListProduct = false;
                            });
                          } else {
                            addToUserWishList(
                                email: widget.email,
                                productID: widget.productID);
                            setState(() {
                              widget.isUserWishListProduct = true;
                            });
                          }
                        }),
                    SizedBox(width: 20),
                    Image(
                        image:
                            AssetImage("assets/images/forward_icon_black.png")),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
