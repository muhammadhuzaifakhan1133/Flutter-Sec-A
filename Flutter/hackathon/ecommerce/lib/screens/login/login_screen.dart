import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/login/fields_and_buttons.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              height: size.height * 0.3,
              color: themeColor,
            ),
            SizedBox(height: size.height * 0.03),
            LoginFieldsAndButtons()
          ],
        ),
      ),
    ));
  }
}
