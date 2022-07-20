import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor: themeColor,
          splash: const Image(image: AssetImage("assets/images/logo.png")),
          nextScreen: const IntroSliderScreens()),
    );
  }
}
