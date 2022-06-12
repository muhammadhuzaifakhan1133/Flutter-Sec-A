import 'package:first/constants/user_constants.dart';
import 'package:flutter/material.dart';

rechargeAndBillPaymentSection() {
  var constants = UserConstants();
  return Container(
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Recharge & Bill Payments",
            style: TextStyle(color: constants.txt_color),
          ),
          Container(
            width: 40,
            height: 40,
            color: Color(0xff343645),
            child: Text(
              "More",
              style: TextStyle(color: Color(0xff696D78)),
            ),
          )
        ]),
        Row(
          children: [
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            ),
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            ),
            Container(
              child: Row(
                children: [Container(), Container()],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
