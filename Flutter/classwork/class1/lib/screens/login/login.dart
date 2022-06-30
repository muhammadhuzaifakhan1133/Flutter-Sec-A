import 'package:class1/constants/color_constants.dart';
import 'package:class1/screens/login/email_password_fields.dart';
import 'package:class1/widgets/login_signup_image_title.dart';
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
              ImageAndTile(
                  gapBeforeWidget: 0.1,
                  title: "Log in",
                  image: "assets/images/login.png",
                  imageTitle: "Schedule task and mark important one",
                  gapAfterWidget: 0.02),
              EmailPasswordFields(),
            ],
          ),
        ),
      ),
    );
  }
}
