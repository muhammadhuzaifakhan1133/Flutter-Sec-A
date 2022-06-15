import 'package:first/widgets/mian_card.dart';
import 'package:flutter/material.dart';

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
        child: mainCard(context,
            enableTopLeftImage: true,
            enableTitle: true,
            enableTopRightImage: true,
            enableAmount: true,
            enableSubTitle: true,
            enableSubCard: true,
            enableBottomButton: true,
            height: 400.0,
            top_left_img: "assets/images/balance_icon1.png",
            title: "Portfolio Value",
            top_right_img: "assets/images/balance_icon2.png",
            amount: "\$54,375",
            subtitle: "In 3 Accounts",
            bank_names: ["Federal Bank", "States Bank", "Best Bank"],
            account_no: ["1142524899652", "1142524899652", "1142521547852"],
            amounts: ["16,456.05", "2045.05", "35873.5"],
            colors: [
              Color.fromRGBO(101, 42, 95, 1),
              Color.fromRGBO(68, 42, 101, 1),
              Color.fromRGBO(42, 101, 80, 1)
            ],
            subCardImage: "assets/images/balance_icon3.png",
            buttonText: "Add / Manage Accounts"),
      ),
    );
  }
}
