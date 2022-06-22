import 'package:class1/screens/login/login.dart';
import 'package:class1/screens/sign_up.dart';
import 'package:class1/widgets/button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Algerian",
                    fontSize: 26)),
            Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/welcome.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    "Maintain your day to day task",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.08),
            buttonWidget(
                context: context,
                text: "Log in",
                button_color: Colors.black,
                width: size.width * 0.8,
                text_size: 20.0,
                go_to: Login()),
            SizedBox(
              height: size.height * 0.01,
            ),
            buttonWidget(
                context: context,
                text: "Sign up",
                button_color: Colors.black,
                width: size.width * 0.8,
                text_size: 20.0,
                go_to: SignUp()),
          ],
        ),
      ),
    );
  }
}
