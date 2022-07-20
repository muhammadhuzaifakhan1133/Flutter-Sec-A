import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/login/feild_errors.dart';
import 'package:ecommerce/screens/login/login_process.dart';
import 'package:ecommerce/screens/register/register_screen.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:ecommerce/widgets/email_and_password_fields.dart';
import 'package:ecommerce/widgets/or_divider.dart';
import 'package:flutter/material.dart';

class LoginFieldsAndButtons extends StatefulWidget {
  const LoginFieldsAndButtons({Key? key}) : super(key: key);

  @override
  State<LoginFieldsAndButtons> createState() => _LoginFieldsAndButtonsState();
}

class _LoginFieldsAndButtonsState extends State<LoginFieldsAndButtons> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  LoginFieldErrors errors = LoginFieldErrors();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.55,
      width: width * 0.85,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EmailAndPasswordFields(
                emailController: emailController,
                passwordController: passwordController,
                errors: errors,
              ),
              buttonWidget(
                  size: size,
                  widthPercent: 0.3,
                  heightPercent: 0.06,
                  radius: 10,
                  text: "Login",
                  buttonColor: themeColor,
                  onpressed: () {
                    completeLoginProcess(
                        setState: setState,
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
                        errors: errors);
                  }),
              orDivider(),
              buttonWidget(
                  size: size,
                  radius: 10,
                  widthPercent: 0.4,
                  heightPercent: 0.06,
                  text: "Login with Google",
                  buttonColor: themeColor,
                  onpressed: () {}),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Column(
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 100,
                      child: const Divider(
                        thickness: 2,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
