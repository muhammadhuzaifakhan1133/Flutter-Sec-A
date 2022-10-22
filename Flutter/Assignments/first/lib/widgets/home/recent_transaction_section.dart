import 'package:first/screens/receive_money.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:flutter/material.dart';

recentTransactionSection(context) {
  double radius = 29;
  double gap = 10;
  List<Widget> recentTransactionProfiles = [];
  for (var i = 0; i < 5; i++) {
    Widget Img = CircleAvatar(
        radius: radius,
        child: Image(
            image: AssetImage("assets/images/home_circle_img${i + 1}.png")));
    recentTransactionProfiles.add(Img);
    recentTransactionProfiles.add(SizedBox(
      width: gap,
    ));
  }
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
          buttonWidget(
              context: context,
              go_to: ReceiveMoney(),
              width: 114.0,
              height: 45.0,
              text: "Receive Money",
              text_size: 14.0,
              button_color: Color.fromRGBO(8, 52, 138, 1),
              radius: 0.0),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        // padding: EdgeInsets.all(5),
        child: Row(
          children: recentTransactionProfiles,
        ),
      )
    ],
  );
}
