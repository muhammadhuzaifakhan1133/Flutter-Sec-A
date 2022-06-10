import 'package:first/constants/user_constants.dart';
import 'package:first/screens/intro.dart';
import 'package:first/screens/login.dart';
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
      home: Login(),
      theme: ThemeData(scaffoldBackgroundColor: userConstants.theme),
      debugShowCheckedModeBanner: false,
    );
  }
}
