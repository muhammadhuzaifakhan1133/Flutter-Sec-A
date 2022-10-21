import 'package:education/constants/color.dart';
import 'package:flutter/material.dart';

Container topContainer(double height, double width) {
  return Container(
    decoration: BoxDecoration(
        color: onboradingColor,
        borderRadius: const BorderRadius.all(Radius.circular(20))),
    height: height * 0.6,
    width: width * 1,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xffFFC229))),
            child: const Text(
              "AiLearn",
              style: TextStyle(
                  color: Color(0xffFFC229),
                  fontWeight: FontWeight.w600,
                  fontSize: 40),
            ),
          ),
          SizedBox(height: height * 0.05),
          Image.asset("assets/imgs/onboarding.png")
        ],
      ),
    ),
  );
}
