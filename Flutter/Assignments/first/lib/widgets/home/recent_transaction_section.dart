import 'package:first/screens/receive_money.dart';
import 'package:first/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

recentTransactionSection(context) {
  double radius = 32;
  double gap = 10;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              NavigateTo(context, ReceiveMoney());
            },
            child: Container(
              width: 114,
              height: 45,
              color: Color.fromRGBO(8, 52, 138, 1),
              child: Center(
                  child: Text(
                "Receive Money",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )),
            ),
          )
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        // padding: EdgeInsets.all(5),
        child: Row(
          children: [
            CircleAvatar(
                radius: radius,
                child: Image(
                    image: AssetImage("assets/images/home_circle_img1.png"))),
            SizedBox(
              width: gap,
            ),
            CircleAvatar(
                radius: radius,
                child: Image(
                    image: AssetImage("assets/images/home_circle_img2.png"))),
            SizedBox(
              width: gap,
            ),
            CircleAvatar(
                radius: radius,
                child: Image(
                    image: AssetImage("assets/images/home_circle_img3.png"))),
            SizedBox(
              width: gap,
            ),
            CircleAvatar(
                radius: radius,
                child: Image(
                    image: AssetImage("assets/images/home_circle_img4.png"))),
            SizedBox(
              width: gap,
            ),
            CircleAvatar(
                radius: radius,
                child: Image(
                    image: AssetImage("assets/images/home_circle_img5.png"))),
            SizedBox(
              width: gap,
            ),
          ],
        ),
      )
    ],
  );
}
