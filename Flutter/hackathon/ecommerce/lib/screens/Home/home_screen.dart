import 'package:ecommerce/functions/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
      child: Text("logout"),
      onPressed: () {
        logout(context: context);
      },
    ));
  }
}
