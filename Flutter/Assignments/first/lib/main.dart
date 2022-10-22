import 'package:first/constants/user_constants.dart';
import 'package:first/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userConstants = UserConstants();
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(scaffoldBackgroundColor: userConstants.theme),
      debugShowCheckedModeBanner: false,
    );
  }
}
