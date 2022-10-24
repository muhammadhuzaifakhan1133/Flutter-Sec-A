import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_louoj/controller/signin/card/fabric_card_controller.dart';
import 'package:login_louoj/controller/signin/card/factory_card_controller.dart';
import 'package:login_louoj/widgets/button_widget.dart';
import 'package:login_louoj/widgets/drop_down_widget.dart';
import 'package:login_louoj/views/signin/widgets/forgot_password_text.dart';
import 'package:login_louoj/widgets/textfield_widget.dart';

class FactoryCard extends StatelessWidget {
  FactoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FactoryCardController controller = FactoryCardController();
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.6,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "SIGN IN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(height: Get.height * 0.07),
              Obx(() => customDropDownWidget(controller)),
              SizedBox(height: 15),
              textfieldWidget(
                  getxController: controller,
                  hintText: "Enter Store ID",
                  icon: Icons.home),
              SizedBox(height: 15),
              textfieldWidget(
                  getxController: controller,
                  hintText: "Enter Your email",
                  icon: Icons.email),
              SizedBox(height: 15),
              textfieldWidget(
                  getxController: controller,
                  hintText: "Enter Your Password",
                  icon: Icons.key),
              SizedBox(height: 5),
              forgotPasswordText(),
              SizedBox(height: 15),
              buttonWidget(
                width: Get.width * 0.3,
                buttonText: "LOGIN",
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
