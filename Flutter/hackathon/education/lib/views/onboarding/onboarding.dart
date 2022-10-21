import 'package:education/constants/color.dart';
import 'package:education/views/onboarding/text_container.dart';
import 'package:education/views/onboarding/top_container.dart';
import 'package:education/views/signup/signup_view.dart';
import 'package:education/widgets.dart/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            topContainer(height, width),
            SizedBox(height: height * 0.05),
            textContainer(),
            customButton(
                context: context,
                widthPercent: 0.9,
                heightPercent: 0.07,
                color: onboradingColor,
                onpressed: () {
                  Get.to(SignUpView());
                }),
          ],
        ),
      ),
    );
  }
}
