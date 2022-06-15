import 'package:first/widgets/rectangle_card.dart';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int no_of_widgets = 5;
  List<String> titles = [
    "Mobile Recharge Offer",
    "DTH Recharge Offer",
    "Flipcart Shopping Offer",
    "Money Transfer Offer",
    "Rs 50 Off on Flights"
  ];
  List<dynamic> subtitles1 = [
    "Use Code FIRST20",
    "Use Code FIRSDTHT20",
    null,
    null,
    null
  ];
  List<String> subtitles2 = [
    "Get 20 % Instant cashback upto Rs 50 on your firs mobile recharge. T&C apply",
    "Get 20 % Instant cashback upto Rs 50 on your first DTH recharge. T&C apply",
    "Shop on Flipcart using our payment system to get upto 50% cashback . T&C appply",
    "Get a scratch card with assuerd casbck and coupons on Money Transfer of Rs 500 or more . T&C apply",
    "Get instant discount on flat 50 Rs on Flight ticket booking. T&C apply"
  ];
  List<Color> colors = [
    Color.fromRGBO(36, 32, 66, 1),
    Color.fromRGBO(59, 32, 66, 1),
    Color.fromRGBO(66, 32, 40, 1),
    Color.fromRGBO(36, 32, 66, 1),
    Color.fromRGBO(59, 32, 66, 1)
  ];

  renderRectangleCard() {
    List<Widget> rectangle_cards = [];
    for (var i = 0; i < no_of_widgets; i++) {
      Widget rectangle_tile = rectangleCardWidget(
          context: context,
          image: "assets/images/offers_img${i + 1}.png",
          title: titles[i],
          subtitle1: subtitles1[i],
          subtitle2: subtitles2[i],
          color: colors[i]);
      rectangle_cards.add(rectangle_tile);
    }
    return rectangle_cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: renderRectangleCard(),
        ),
      ),
    );
  }
}
