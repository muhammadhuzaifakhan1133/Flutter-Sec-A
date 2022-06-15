import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/intro/intro_material.dart';
import 'package:flutter/material.dart';

sliderWidget(context, {slider_num}) {
  var constants = UserConstants();
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: constants.theme,
    child: introMaterial(
        img: constants.intro_img[slider_num],
        title: constants.intro_title[slider_num],
        description: constants.intro_description[slider_num],
        slide_num: slider_num,
        context: context),
  );
}
