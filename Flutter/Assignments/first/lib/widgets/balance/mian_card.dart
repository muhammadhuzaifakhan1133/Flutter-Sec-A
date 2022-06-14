import 'package:flutter/material.dart';
import 'package:first/widgets/balance/rounded_card.dart';

mainCard(
    {context,
    required String top_left_img,
    required String top_right_img,
    required String title,
    required String amount,
    required String subtitle,
    required List<String> card1_text,
    required Color card1_color,
    required List<String> card2_text,
    required Color card2_color,
    required List<String> card3_text,
    required Color card3_color,
    required String img,
    required String button_text,
    required Color button_color}) {
  RoundedRectangleBorder card_border = RoundedRectangleBorder(
    side: BorderSide(
      color: Theme.of(context).colorScheme.outline,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
  return Card(
    shape: card_border,
    elevation: 15,
    color: Color.fromRGBO(31, 34, 42, 1),
    child: Container(
      width: double.infinity,
      height: 400,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(top_left_img),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Image(
                image: AssetImage(top_right_img),
              )
            ],
          ),
          Text(
            amount,
            style: TextStyle(
                color: Color.fromRGBO(176, 190, 197, 1),
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: Color.fromRGBO(176, 190, 197, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              roundedCardWidget(
                  bank_name: card1_text[0],
                  account_no: card1_text[1],
                  amount: card1_text[2],
                  color: card1_color),
              roundedCardWidget(
                  bank_name: card2_text[0],
                  account_no: card2_text[1],
                  amount: card2_text[2],
                  color: card2_color),
            ],
          ),
          Row(
            children: [
              roundedCardWidget(
                  bank_name: card3_text[0],
                  account_no: card3_text[1],
                  amount: card3_text[2],
                  color: card3_color),
              SizedBox(
                width: 70,
              ),
              Image(
                image: AssetImage(img),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              button_text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                elevation: 10,
                primary: button_color),
          )
        ],
      ),
    ),
  );
}
