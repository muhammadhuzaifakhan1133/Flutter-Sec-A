import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/home/rectangle_box_widget.dart';
import 'package:flutter/material.dart';

rectangularSectionWidget(
    {context,
    title,
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
  List<IconData> icons = [icon1, icon2, icon3, icon4];
  List<Color> left_colors = [
    left_color1,
    left_color2,
    left_color3,
    left_color4
  ];
  List<Color> right_colors = [
    right_color1,
    right_color2,
    right_color3,
    right_color4
  ];
  List<String> texts = [text1, text2, text3, text4];
  List<Widget> rectangle_widgets = [];
  for (var i = 0; i < 4; i++) {
    Widget rectangle_box = rectangleBoxWidget(
        icon: icons[i],
        left_color: left_colors[i],
        right_color: right_colors[i],
        text: texts[i]);
    rectangle_widgets.add(rectangle_box);
  }
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
              buttonWidget(
                  context: context,
                  button_color: Color(0xff343645),
                  radius: 15.0,
                  width: 50.0,
                  height: 25.0,
                  text: "More >",
                  text_color: Color(0xff696D78),
                  text_size: 13.0)
            ]),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: rectangle_widgets.sublist(0, 2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: rectangle_widgets.sublist(2),
          ),
        ),
      ],
    ),
    padding: EdgeInsets.only(bottom: 20),
  );
}
