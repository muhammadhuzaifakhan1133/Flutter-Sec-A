import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/home/more_button.dart';
import 'package:first/widgets/home/rectangle_box_widget.dart';
import 'package:flutter/material.dart';

rectangularSectionWidget(
    {title,
    icon1,
    left_color1,
    right_color1,
    text1,
    icon2,
    left_color2,
    right_color2,
    text2,
    icon3,
    left_color3,
    right_color3,
    text3,
    icon4,
    left_color4,
    right_color4,
    text4}) {
  var constants = UserConstants();
  return Container(
    child: Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: constants.txt_color,
                  fontSize: 22,
                ),
              ),
              moreButton()
            ]),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              rectangleBoxWidget(
                  icon: icon1,
                  left_color: left_color1,
                  right_color: right_color1,
                  text: text1),
              rectangleBoxWidget(
                  icon: icon2,
                  left_color: left_color2,
                  right_color: right_color2,
                  text: text2)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              rectangleBoxWidget(
                  icon: icon3,
                  left_color: left_color3,
                  right_color: right_color3,
                  text: text3),
              rectangleBoxWidget(
                  icon: icon4,
                  left_color: left_color4,
                  right_color: right_color4,
                  text: text4)
            ],
          ),
        ),
      ],
    ),
    padding: EdgeInsets.only(bottom: 20),
  );
}
