import 'package:ecommerce/functions/convert_to_k_m_b_units.dart';
import 'package:flutter/material.dart';

Widget productShareInfo(shareCount) {
  return Row(
    children: [
      Image(image: AssetImage("assets/images/forward_icon.png")),
      Text(
        convertToKMBUnits(shareCount),
        style: TextStyle(color: Color(0xffD6D6D6)),
      )
    ],
  );
}
