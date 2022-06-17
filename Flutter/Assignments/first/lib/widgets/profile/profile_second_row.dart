import 'package:first/widgets/profile/button_with_icon.dart';
import 'package:flutter/material.dart';

profileSecondRow() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "1,208",
                style: TextStyle(color: Color(0xff4D5DFA), fontSize: 22),
              ),
              Text(
                "Transaction",
                style: TextStyle(color: Color(0xff939FA4), fontSize: 15),
              ),
            ],
          ),
          SizedBox(width: 7),
          VerticalDivider(
            thickness: 1,
            color: Color(0xffF8F8F8),
          ),
          SizedBox(width: 7),
          Column(
            children: [
              Text(
                "726",
                style: TextStyle(color: Color(0xff4D5DFA), fontSize: 22),
              ),
              Text(
                "Points",
                style: TextStyle(color: Color(0xff939FA4), fontSize: 15),
              ),
            ],
          ),
          SizedBox(width: 7),
          VerticalDivider(
            thickness: 1,
            color: Color(0xffF8F8F8),
          ),
          SizedBox(width: 7),
          Column(
            children: [
              Text(
                "8",
                style: TextStyle(color: Color(0xff4D5DFA), fontSize: 22),
              ),
              Text(
                "Rank",
                style: TextStyle(color: Color(0xff939FA4), fontSize: 15),
              ),
            ],
          ),
          SizedBox(width: 20),
          buttonWithSuffixIcon(
              text: "Explore",
              iconPath: "assets/images/profile_explore_icon.png")
        ],
      ),
    ),
  );
}
