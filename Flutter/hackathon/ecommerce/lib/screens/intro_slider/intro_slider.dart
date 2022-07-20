import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/intro_slider/render_slides.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroSliderScreens extends StatelessWidget {
  const IntroSliderScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      showDoneBtn: false,
      showNextBtn: false,
      showPrevBtn: false,
      showSkipBtn: false,
      showDotIndicator: true,
      colorDot: Colors.black,
      colorActiveDot: textColor,
      sizeDot: 10,
      listCustomTabs: renderSlides(context: context),
    );
  }
}
