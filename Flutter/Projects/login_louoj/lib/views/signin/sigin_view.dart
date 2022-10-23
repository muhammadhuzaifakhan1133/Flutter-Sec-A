import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_louoj/controller/signin/signin_controller.dart';
import 'package:login_louoj/views/signin/widgets/background.dart';
import 'package:login_louoj/widgets/button_widget.dart';
import 'package:login_louoj/views/signin/widgets/category_circles.dart';
import 'package:login_louoj/views/signin/widgets/title.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    double h = Get.height;
    SigninController controler = Get.put(SigninController(), tag: "signin");
    return Scaffold(
      body: Stack(
        children: [
          SigninBackground(),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.15,
                ),
                title(),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    CategoryCircles(),
                    SizedBox(width: 20),
                    Obx(() => controler.cards[controler.card_no.value])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                  child: buttonWidget(
                    buttonText: "Register Your Business",
                    color: Colors.blue[700],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
