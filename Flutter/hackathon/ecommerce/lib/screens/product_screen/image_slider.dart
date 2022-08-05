import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/Home/product_card/favorite_icon.dart';
import 'package:ecommerce/screens/product_screen/render_slide_img.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

imageSlider(
    {required BuildContext context,
    required List<dynamic> imgPaths,
    required bool isUserWishListProduct,
    required String email,
    required String productID,
    required onFavoriteChange}) {
  return Stack(
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
          autoScroll: false,
          colorDot: Colors.grey,
          colorActiveDot: themeColor,
          sizeDot: 10,
          listCustomTabs: renderProductImgSlides(imgPaths: imgPaths),
        ),
      ),
      Positioned(
        left: 0,
        top: 25,
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
        top: 25,
        right: 0,
        child: Row(
          children: [
            FavoriteIcon(
                isUserWishListProduct: [isUserWishListProduct],
                productID: productID,
                onFavoriteChange: onFavoriteChange,
                email: email),
            SizedBox(width: 20),
            Image(image: AssetImage("assets/images/forward_icon_black.png")),
            SizedBox(width: 10)
          ],
        ),
      ),
    ],
  );
}
