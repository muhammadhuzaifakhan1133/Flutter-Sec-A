import 'package:education/constants/color.dart';
import 'package:education/views/login/login_view.dart';
import 'package:education/views/signup/signup_text.dart';
import 'package:education/widgets.dart/back_button.dart';
import 'package:education/widgets.dart/custom_button.dart';
import 'package:education/widgets.dart/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
            customTextField(labelText: "your name", context: context),
            customTextField(labelText: "your email", context: context),
            customTextField(labelText: "your password", context: context),
            customTextField(labelText: "confirm password", context: context),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                InkWell(
                  onTap: () {
                    Get.to(LoginView());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            customButton(
                context: context,
                widthPercent: 0.5,
                color: onboradingColor,
                heightPercent: 0.05,
                onpressed: () {})
          ],
        ),
      ),
    );
  }
}
