// ignore_for_file: deprecated_member_use

import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/intro/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var constants = UserConstants();

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      sliderWidget(context: context, slider_num: 0),
      sliderWidget(context: context, slider_num: 1),
      sliderWidget(context: context, slider_num: 2),
    ];
    return IntroSlider(
      backgroundColorAllSlides: constants.theme,
      showNextBtn: true,
      showSkipBtn: false,
      showDoneBtn: false,
      showPrevBtn: true,
      colorActiveDot: constants.txt_color,
      sizeDot: 8.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      colorDot: constants.txt_color,
      listCustomTabs: tabs,
      scrollPhysics: const BouncingScrollPhysics(),
      hideStatusBar: false,
    );
  }
}
