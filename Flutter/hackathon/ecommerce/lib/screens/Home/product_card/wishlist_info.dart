import 'package:ecommerce/functions/convert_to_k_m_b_units.dart';
import 'package:ecommerce/screens/Home/product_card/favorite_icon.dart';
import 'package:flutter/material.dart';

Widget isProductUserWishList(
    {required List<bool> isUserWishListProduct,
    required int wishlistCount,
    required String email,
    required String productID}) {
  return Row(
    children: [
      FavoriteIcon(
          isUserWishListProduct: isUserWishListProduct,
          productID: productID,
          email: email),
      Text(
        convertToKMBUnits(wishlistCount),
        style: TextStyle(fontSize: 12),
      )
    ],
  );
}
