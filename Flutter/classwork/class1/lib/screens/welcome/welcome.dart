import 'package:class1/constants/color_constants.dart';
import 'package:class1/screens/login/login.dart';
import 'package:class1/screens/signup/sign_up.dart';
import 'package:class1/widgets/button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.08),
              const Text("Welcome",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Algerian",
                      fontSize: 26)),
              Stack(
                alignment: Alignment.center,
                children: const [
                  Image(
                    image: AssetImage("assets/images/welcome.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      "Maintain your day to day task",
                      style: TextStyle(color: subTextColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.08),
              buttonWidget(
                  context: context,
                  text: "Log in",
                  width: size.width * 0.8,
                  text_size: 20.0,
                  go_to: Login()),
              SizedBox(
                height: size.height * 0.01,
              ),
              buttonWidget(
                  context: context,
                  text: "Sign up",
                  width: size.width * 0.8,
                  text_size: 20.0,
                  go_to: SignUp()),
            ],
          ),
        ),
      ),
    );
  }
}
