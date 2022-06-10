import 'package:first/widgets/buttons/intro_button.dart';
import 'package:flutter/material.dart';

lastPageMaterial(context, btn_bgcolor) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(
      top: 65,
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        introButton(context, btn_bgcolor),
        Text(
          "Your perfect payment partner",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        )
      ],
    ),
  );
}
