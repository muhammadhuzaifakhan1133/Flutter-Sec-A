import 'package:flutter/material.dart';
import 'package:newproject/screens/counter.dart';
import 'package:newproject/screens/dashboard.dart';
import 'package:newproject/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
