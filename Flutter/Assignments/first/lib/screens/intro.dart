// ignore_for_file: deprecated_member_use

import 'package:first/constants/user_constants.dart';
import 'package:first/widgets/intro/intro_material.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var constants = UserConstants();
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < constants.no_of_slides; i++) {
      slides.add(Slide(
          title: constants.intro_title[i],
          description: constants.intro_description[i],
          pathImage: constants.intro_img[i]));
    }
  }

  renderListCustomTabs() {
    List<Widget> tabs = [];
    for (var i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        color: constants.theme,
        child: introMaterial(
            img: currentSlide.pathImage,
            title: currentSlide.title,
            description: currentSlide.description,
            slide_num: i,
            context: context),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: constants.theme,
      showNextBtn: true,
      showSkipBtn: false,
      showDoneBtn: false,
      showPrevBtn: true,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      colorDot: Colors.white,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
    );
  }
}
