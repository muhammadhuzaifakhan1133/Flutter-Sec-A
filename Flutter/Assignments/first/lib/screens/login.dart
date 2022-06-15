import 'package:first/constants/user_constants.dart';
import 'package:first/screens/tabs.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/login/design.dart';
import 'package:first/widgets/login/input_phone_number.dart';
import 'package:first/widgets/login/policy_description.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var constants = UserConstants();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginDesign(),
            inputPhoneNumber(controller: controller),
            const SizedBox(
              height: 15,
            ),
            buttonWidget(
                context: context,
                radius: 30.0,
                width: 350.0,
                height: 40.0,
                text: "Verify"),
            policyDescription()
          ],
        ),
      ),
    );
  }
}
