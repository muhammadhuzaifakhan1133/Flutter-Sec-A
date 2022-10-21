import 'package:education/constants/color.dart';
import 'package:education/views/bottom_bar/bottom_bar.dart';
import 'package:education/views/signup/signup_text.dart';
import 'package:education/widgets.dart/back_button.dart';
import 'package:education/widgets.dart/custom_button.dart';
import 'package:education/widgets.dart/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                backbutton(),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            signupText(context),
            SizedBox(height: size.height * 0.05),
            customTextField(labelText: "your email", context: context),
            customTextField(labelText: "your password", context: context),
            SizedBox(height: size.height * 0.1),
            customButton(
                context: context,
                widthPercent: 0.5,
                color: onboradingColor,
                heightPercent: 0.05,
                onpressed: () {
                  Get.to(BottomBar());
                })
          ],
        ),
      ),
    );
  }
}
