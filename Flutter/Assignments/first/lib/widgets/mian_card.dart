import 'package:first/screens/tabs.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:first/widgets/balance/rounded_card.dart';

mainCard(
  context, {
  double width = double.infinity,
  double? height,
  MainAxisAlignment alignment = MainAxisAlignment.start,
  String? top_left_img,
  String? top_right_img,
  String? title,
  double title_size = 15.0,
  FontWeight fontWeight = FontWeight.bold,
  String? amount,
  String? subtitle,
  List<String>? bank_names,
  List<String>? account_no,
  List<String>? amounts,
  List<Color>? colors,
  String? subCardImage,
  String? buttonText,
  Color buttonTextColor = Colors.white,
  double buttonTextSize = 16.0,
  double buttonWidth = double.infinity,
  double buttonHeight = 43.0,
  double buttonRadius = 12.0,
  goTo = const TabBarController(),
  Color buttonColor = const Color.fromRGBO(52, 54, 69, 1),
  String? image,
  double? imageWidth,
  double? imageHeight,
  bool enableTopLeftImage = false,
  bool enableTitle = false,
  bool enableTopRightImage = false,
  bool enableSubCard = false,
  bool enableBottomButton = false,
  bool enableAmount = false,
  bool enableSubTitle = false,
  bool enableImage = false,
}) {
  // This list will contain all widgets of this card
  List<Widget> all_widgets = [];

  // this list contain  top row widgets consist of topLeftImage, title and topRightImage in sequence
  List<Widget> topRowWidgets = [];

  // for topLeftImage
  if (enableTopLeftImage && top_left_img != null) {
    topRowWidgets.add(Image(image: AssetImage(top_left_img)));
  }

  // for title
  if (enableTitle && title != null) {
    topRowWidgets.add(Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: title_size, fontWeight: fontWeight),
    ));
  }

  // for topRightImage
  if (enableTopRightImage && top_right_img != null) {
    topRowWidgets.add(Image(image: AssetImage(top_right_img)));
  }

  Widget topRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: topRowWidgets,
  );
  all_widgets.add(topRow);

  // for subcard
  List<Widget> cardRow1 = []; // this will contain 2 cards
  List<Widget> cardRow2 = []; // this will contain 1 card and 1 image
  if (enableSubCard &&
      bank_names != null &&
      account_no != null &&
      amounts != null &&
      subCardImage != null &&
      colors != null) {
    List<Widget> cards = []; // this will contain cardRow1 + cardRow2
    for (var i = 0; i < 3; i++) {
      cards.add(roundedCardWidget(
          bank_name: bank_names[i],
          account_no: account_no[i],
          amount: amounts[i],
          color: colors[i]));
    }
    cards.add(SizedBox(
      width: 70,
    ));
    cards.add(Image(
      image: AssetImage(subCardImage),
    ));
    cardRow1 = cards.sublist(0, 2);
    cardRow2 = cards.sublist(2);
  }

  all_widgets.add(Row(children: cardRow1));
  all_widgets.add(Row(children: cardRow2));

  // for big image like barcode
  if (enableImage && image != null) {
    all_widgets.insert(
        1,
        Container(
          margin: EdgeInsets.all(10),
          child: Image(
              image: AssetImage(image),
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.fill),
        ));
  }

  // for amount
  if (enableAmount && amount != null) {
    all_widgets.insert(
        1,
        Text(
          amount,
          style: TextStyle(
              color: Color.fromRGBO(176, 190, 197, 1),
              fontSize: 36.0,
              fontWeight: FontWeight.bold),
        ));
  }

  // for subTitle
  if (enableSubTitle && subtitle != null) {
    all_widgets.insert(
        2,
        Text(
          subtitle,
          style: TextStyle(
              color: Color.fromRGBO(176, 190, 197, 1),
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ));
  }

  // for bottom button
  if (enableBottomButton && buttonText != null) {
    all_widgets.add(buttonWidget(
        context: context,
        text: buttonText,
        text_color: buttonTextColor,
        text_size: buttonTextSize,
        width: buttonWidth,
        height: buttonHeight,
        radius: buttonRadius,
        go_to: goTo,
        button_color: buttonColor));
  }

  // this is the shape of the main card
  RoundedRectangleBorder cardShape = RoundedRectangleBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );

  // this is our main card
  return Card(
    shape: cardShape,
    elevation: 15,
    color: Color.fromRGBO(31, 34, 42, 1),
    child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: alignment,
        children: all_widgets,
      ),
    ),
  );
}
