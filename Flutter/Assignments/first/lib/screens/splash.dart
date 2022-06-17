import 'package:first/constants/user_constants.dart';
import 'package:first/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var constants = UserConstants();
    return AnimatedSplashScreen(
      backgroundColor: constants.theme,
      splash: constants.logo,
      nextScreen: Intro(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
