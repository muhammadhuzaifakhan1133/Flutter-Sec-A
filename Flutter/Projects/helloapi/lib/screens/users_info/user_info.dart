import 'package:flutter/material.dart';
import 'package:helloapi/model/user_model.dart';
import 'package:helloapi/screens/users_info/render_slides.dart';
import 'package:intro_slider/intro_slider.dart';

class UserInfo extends StatelessWidget {
  UserInfo({required this.users, required this.index, Key? key})
      : super(key: key);
  List<User> users;
  int index;
  Function? goToTab;

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        showDoneBtn: false,
        refFuncGoToTab: (refFunc) {
          goToTab = refFunc;
          goToTab!(index);
        },
        prevButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        nextButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        showSkipBtn: false,
        showDotIndicator: true,
        autoScroll: false,
        colorActiveDot: Colors.blue,
        onNextPress: () {
          index += 1;
        },
        colorDot: Colors.black,
        listCustomTabs: renderSlides(users: users, context: context));
  }
}
