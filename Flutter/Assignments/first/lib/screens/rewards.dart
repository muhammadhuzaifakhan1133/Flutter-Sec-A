import 'package:first/widgets/mian_card.dart';
import 'package:first/widgets/rectangle_card.dart';
import 'package:first/widgets/sqaure_widget.dart';
import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 182,
                child: mainCard(context,
                    enableTitle: true,
                    enableAmount: true,
                    enableSubTitle: true,
                    enableBottomButton: true,
                    title: "Cashbacks earned",
                    amount: "\$507",
                    subtitle: "+88 Rs This month",
                    height: 300.0,
                    buttonText: "View your cashback history",
                    alignment: MainAxisAlignment.spaceAround)),
            SizedBox(height: 10),
            Text("Scrachcards won",
                style: TextStyle(color: Colors.white, fontSize: 17)),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                square(width: 100.0, height: 100.0),
                square(width: 100.0, height: 100.0),
                square(width: 100.0, height: 100.0),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Collect Rewards",
                style: TextStyle(color: Colors.white, fontSize: 17)),
            rectangleCardWidget(
                context: context,
                image: "assets/images/rewards_img1.png",
                title: "Flat 50 off On food Delivery",
                subtitle1: "On orders above 99 on Swaggy",
                height: 111.0,
                color: Color.fromRGBO(36, 32, 66, 1),
                enableCollectbtn: true),
            rectangleCardWidget(
                context: context,
                image: "assets/images/rewards_img2.png",
                title: "20% Cashback On Amason",
                subtitle1: "Up to Rs 150 Minimum Order 1000",
                height: 111.0,
                color: Color.fromRGBO(66, 32, 56, 1),
                enableCollectbtn: true)
          ],
        ),
      ),
    ));
  }
}
