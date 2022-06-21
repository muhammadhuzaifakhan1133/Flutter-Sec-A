import 'package:class1/screens/home.dart';
import 'package:class1/screens/login.dart';
import 'package:class1/screens/splash.dart';
import 'package:class1/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Welcome());
  }
}
