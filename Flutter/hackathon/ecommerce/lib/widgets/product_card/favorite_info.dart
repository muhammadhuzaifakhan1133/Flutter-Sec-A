import 'package:ecommerce/functions/convert_to_k_m_b_units.dart';
import 'package:flutter/material.dart';

Widget productFavoriteInfo(
    {required bool isUserFavorite, required int favoriteCount}) {
  return Row(
    children: [
      Icon(
        isUserFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      Text(
        convertToKMBUnits(favoriteCount),
        style: TextStyle(fontSize: 12),
      )
    ],
  );
}
