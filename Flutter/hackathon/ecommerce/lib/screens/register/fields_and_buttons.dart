import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/screens/register/feild_errors.dart';
import 'package:ecommerce/screens/register/register_process.dart';
import 'package:ecommerce/screens/register/register_screen.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:ecommerce/widgets/email_and_password_fields.dart';
import 'package:ecommerce/widgets/password_suffix_icon.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterFieldsAndButtons extends StatefulWidget {
  const RegisterFieldsAndButtons({Key? key}) : super(key: key);

  @override
  State<RegisterFieldsAndButtons> createState() =>
      _RegisterFieldsAndButtonsState();
}

class _RegisterFieldsAndButtonsState extends State<RegisterFieldsAndButtons> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RegisterFieldErrors errors = RegisterFieldErrors();
  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            textFieldWidget(
                size: size,
                errorText: errors.nameError,
                controller: nameController,
                labelText: "Enter your name",
                keyboardtype: TextInputType.name),
            EmailAndPasswordFields(
              emailController: emailController,
              passwordController: passwordController,
              errors: errors,
            ),
            textFieldWidget(
                size: size,
                errorText: errors.confrimPasswordError,
                prefixIcon: Icons.lock,
                obscureText: confirmPasswordObscureText,
                controller: confirmPasswordController,
                labelText: "Enter confirm passsword",
                suffixIcon: passwordSuffixIcon(confirmPasswordObscureText),
                onPressedSuffixIcon: () {
                  setState(() {
                    confirmPasswordObscureText = !confirmPasswordObscureText;
                  });
                },
                keyboardtype: TextInputType.visiblePassword),
            SizedBox(height: 10),
            buttonWidget(
                size: size,
                buttonColor: themeColor,
                radius: 10,
                widthPercent: 0.3,
                heightPercent: 0.06,
                text: "Register",
                onpressed: () {
                  registerProcess(
                      setState: setState,
                      context: context,
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      errors: errors);
                }),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Accout? "),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
