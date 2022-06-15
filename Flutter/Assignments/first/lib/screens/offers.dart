import 'package:first/widgets/rectangle_card.dart';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            rectangleCardWidget(
                context: context,
                image: "assets/images/offers_img1.png",
                title: "Mobile Recharge Offer",
                subtitle1: "Use Code FIRST20",
                subtitle2:
                    "Get 20 % Instant cashback upto Rs 50 on your firs mobile recharge. T&C apply",
                color: Color.fromRGBO(36, 32, 66, 1)),
            rectangleCardWidget(
                context: context,
                image: "assets/images/offers_img2.png",
                title: "DTH Recharge Offer",
                subtitle1: "Use Code FIRSDTHT20",
                subtitle2:
                    "Get 20 % Instant cashback upto Rs 50 on your first DTH recharge. T&C apply",
                color: Color.fromRGBO(59, 32, 66, 1)),
            rectangleCardWidget(
                context: context,
                image: "assets/images/offers_img3.png",
                title: "Flipcart Shopping Offer",
                subtitle2:
                    "Shop on Flipcart using our payment system to get upto 50% cashback . T&C appply",
                color: Color.fromRGBO(66, 32, 40, 1)),
            rectangleCardWidget(
                context: context,
                image: "assets/images/offers_img4.png",
                title: "Money Transfer Offer",
                subtitle2:
                    "Get a scratch card with assuerd casbck and coupons on Money Transfer of Rs 500 or more . T&C apply",
                color: Color.fromRGBO(36, 32, 66, 1)),
            rectangleCardWidget(
                context: context,
                image: "assets/images/offers_img5.png",
                title: "Rs 50 Off on Flights",
                subtitle2:
                    "Get instant discount on flat 50 Rs on Flight ticket booking. T&C apply",
                color: Color.fromRGBO(59, 32, 66, 1)),
          ],
        ),
      ),
    );
  }
}
