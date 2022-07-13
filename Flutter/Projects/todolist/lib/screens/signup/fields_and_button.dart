import 'package:flutter/material.dart';
import 'package:todolist/screens/signup/signup_process.dart';
import 'package:todolist/screens/signup/signup_text_fields_errors.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButton extends StatefulWidget {
  const FieldsAndButton({Key? key}) : super(key: key);

  @override
  State<FieldsAndButton> createState() => _FieldsAndButtonState();
}

class _FieldsAndButtonState extends State<FieldsAndButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  SignUpTextFieldErrors errors = SignUpTextFieldErrors();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        textFieldWidget(
            size: size,
            errorText: errors.nameError,
            controller: nameController,
            labelText: "Enter name",
            keyboardtype: TextInputType.name),
        textFieldWidget(
            size: size,
            errorText: errors.emailError,
            controller: emailController,
            labelText: "Enter email",
            keyboardtype: TextInputType.emailAddress),
        textFieldWidget(
            size: size,
            errorText: errors.passwordError,
            controller: passwordController,
            labelText: "Enter password",
            obscureText: obscureTextPassword,
            keyboardtype: TextInputType.visiblePassword,
            suffixIcon: suffixIcon(obscureTextPassword),
            onPressedSuffixIcon: () {
              setState(() {
                obscureTextPassword = !obscureTextPassword;
              });
            }),
        textFieldWidget(
            size: size,
            errorText: errors.confirmPasswordError,
            controller: confirmPasswordController,
            labelText: "Enter confirm password",
            obscureText: obscureTextConfirmPassword,
            keyboardtype: TextInputType.visiblePassword,
            suffixIcon: suffixIcon(obscureTextConfirmPassword),
            onPressedSuffixIcon: () {
              setState(() {
                obscureTextConfirmPassword = !obscureTextConfirmPassword;
              });
            }),
        buttonWidget(
            size: size,
            text: "Sign up",
            onpressed: () async {
              await signUp(
                  context: context,
                  setState: setState,
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                  errors: errors);
            })
      ],
    );
  }
}
