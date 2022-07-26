import 'package:ecommerce/functions/convert_to_k_m_b_units.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:flutter/material.dart';

Widget isProductUserWishList(
    {required bool isUserWishListProduct,
    required int wishlistCount,
    required String email,
    required String productID}) {
  return Row(
    children: [
      IconButton(
          icon: Icon(
            isUserWishListProduct ? Icons.favorite : Icons.favorite_border,
            color: isUserWishListProduct ? Colors.red : Colors.black,
          ),
          onPressed: () {
            if (isUserWishListProduct) {
              removeFromUserWishList(email: email, productID: productID);
            } else {
              addToUserWishList(email: email, productID: productID);
            }
          }),
      Text(
        convertToKMBUnits(wishlistCount),
        style: TextStyle(fontSize: 12),
      )
    ],
  );
}
