import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:todolist/screens/welcome/welcome.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image(image: AssetImage("assets/images/logo.png")),
      nextScreen: Welcome(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
