import 'dart:io';

import 'package:first/constants/user_constants.dart';
import 'package:first/screens/tabs.dart';
import 'package:first/widgets/buttons/button.dart';
import 'package:first/widgets/login/design.dart';
import 'package:first/widgets/login/input_phone_number.dart';
import 'package:first/widgets/login/policy_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var constants = UserConstants();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginDesign(),
            inputPhoneNumber(controller: controller),
            SizedBox(
              height: 15,
            ),
            buttonWidget(context,
                border_radius: 30.0,
                width: 350.0,
                height: 40.0,
                text: "Verify",
                go_to: TabsBar()),
            policyDescription()
          ],
        ),
      ),
    );
  }
}
