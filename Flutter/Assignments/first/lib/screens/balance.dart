import 'package:first/widgets/balance/mian_card.dart';
import 'package:first/widgets/balance/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: mainCard(
            context: context,
            top_left_img: "assets/images/balance_icon1.png",
            title: "Portfolio Value",
            top_right_img: "assets/images/balance_icon2.png",
            amount: "\$54,375",
            subtitle: "In 3 Accounts",
            card1_color: Color.fromRGBO(101, 42, 95, 1),
            card1_text: ["Federal Bank", "1142524899652", "16,456.05"],
            card2_color: Color.fromRGBO(68, 42, 101, 1),
            card2_text: ["States Bank", "1142524899652", "2045.05"],
            card3_color: Color.fromRGBO(42, 101, 80, 1),
            card3_text: ["Best Bank", "1142521547852", "35873.5"],
            img: "assets/images/balance_icon3.png",
            button_color: Color.fromRGBO(52, 54, 69, 1),
            button_text: "Add / Manage Accounts"),
      ),
    );
  }
}
