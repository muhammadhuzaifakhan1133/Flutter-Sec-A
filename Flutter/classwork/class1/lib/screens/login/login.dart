import 'package:class1/constants/color_constants.dart';
import 'package:class1/screens/login/email_password_fields.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              Text("Log in",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Algerian",
                      fontSize: 26)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/login.png"),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Text("Schedule task and mark important one",
                          style: TextStyle(color: subTextColor, fontSize: 18)))
                ],
              ),
              SizedBox(height: size.height * 0.02),
              EmailPasswordFields(),
            ],
          ),
        ),
      ),
    );
  }
}
