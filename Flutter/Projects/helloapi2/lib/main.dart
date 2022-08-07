import 'package:flutter/material.dart';
import 'package:helloapi2/screens/welcome.dart';
import 'package:helloapi2/services/model_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Welcome());
  }
}
