import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/users_info/render_slides.dart';
import 'package:intro_slider/intro_slider.dart';

class UserInfo extends StatelessWidget {
  UserInfo({required this.slides, required this.index, Key? key})
      : super(key: key);
  List<Widget> slides;
  int index;
  Function? goToTab;

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        refFuncGoToTab: (refFunc) {
          goToTab = refFunc;
          goToTab!(index);
        },
        onNextPress: () {
          index += 1;
        },
        showDoneBtn: false,
        showSkipBtn: false,
        autoScroll: false,
        showDotIndicator: true,
        colorActiveDot: Colors.black,
        colorDot: Colors.blue,
        typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
        prevButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        nextButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        listCustomTabs: slides);
  }
}
