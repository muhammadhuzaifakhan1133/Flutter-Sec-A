import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/bag/total_price_bag_products.dart';
import 'package:ecommerce/screens/payment_successful/payment_successful.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';

bagScreenBottomBar(
    {required BuildContext context,
    required TotalPriceBagProducts bagProducts,
    required bool enableButton,
    required onPressedPayNow}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Total ", style: TextStyle(color: Colors.grey, fontSize: 22)),
        TextSpan(
            text: "\$ ${bagProducts.totalPrice.toStringAsFixed(2)}",
            style: TextStyle(
                color: themeColor, fontSize: 22, fontWeight: FontWeight.bold))
      ]),
    ),
    buttonWidget(
        size: MediaQuery.of(context).size,
        text: "Pay Now",
        enable: enableButton,
        buttonColor: themeColor,
        widthPercent: 0.5,
        radius: 5,
        heightPercent: 0.07,
        onpressed: onPressedPayNow),
  ]);
}
