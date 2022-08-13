import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class UserInfo extends StatelessWidget {
  UserInfo({required this.slides, required this.index, Key? key})
      : super(key: key);
  List<Widget> slides;
  int index;
  Function? goToTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text("User Information",
            style: TextStyle(color: Colors.black)),
      ),
      body: IntroSlider(
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
          colorDot: Colors.indigo,
          renderNextBtn: Icon(Icons.keyboard_double_arrow_right, size: 30),
          renderPrevBtn: Icon(Icons.keyboard_double_arrow_left, size: 30),
          typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
          listCustomTabs: slides),
    );
  }
}
