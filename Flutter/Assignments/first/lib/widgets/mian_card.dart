import 'package:first/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:first/widgets/balance/rounded_card.dart';

mainCard(context,
    {enableTopCornerImages = true,
    enableSubCard = true,
    width = double.infinity,
    height,
    alignment: MainAxisAlignment.start,
    top_left_img,
    top_right_img,
    title,
    amount,
    subtitle,
    bank_names,
    account_no,
    amounts,
    colors,
    img,
    button_text,
    button_color = const Color.fromRGBO(52, 54, 69, 1)}) {
  List<Widget> topRowWidgets = [];
  Widget title_widget = Text(
    title,
    style: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
  );
  Widget topRow;
  if (enableTopCornerImages) {
    List<String> images = [top_left_img, top_right_img];
    for (var img in images) {
      topRowWidgets.add(Image(image: AssetImage(img)));
    }
    topRowWidgets.insert(topRowWidgets.length - 1, title_widget);
    topRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: topRowWidgets,
    );
  } else {
    topRow = title_widget;
  }
  List<Widget> textRows = [];
  List<double> fontSizes = [36.0, 15.0];
  List<String> amt_and_subtitle = [amount, subtitle];
  for (var i = 0; i < 2; i++) {
    textRows.add(Text(
      amt_and_subtitle[i],
      style: TextStyle(
          color: Color.fromRGBO(176, 190, 197, 1),
          fontSize: fontSizes[i],
          fontWeight: FontWeight.bold),
    ));
  }
  List<Widget> cardRow1 = [];
  List<Widget> cardRow2 = [];
  if (enableSubCard) {
    List<Widget> cards = [];
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
      image: AssetImage(img),
    ));
    cardRow1 = cards.sublist(0, 2);
    cardRow2 = cards.sublist(2);
  }

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    elevation: 15,
    color: Color.fromRGBO(31, 34, 42, 1),
    child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: alignment,
        children: [
          topRow,
          textRows[0],
          textRows[1],
          Row(
            children: cardRow1,
          ),
          Row(
            children: cardRow2,
          ),
          buttonWidget(
              context: context, text: button_text, button_color: button_color)
        ],
      ),
    ),
  );
}
