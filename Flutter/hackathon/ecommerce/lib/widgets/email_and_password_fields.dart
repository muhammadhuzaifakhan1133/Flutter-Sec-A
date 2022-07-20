import 'package:ecommerce/widgets/password_suffix_icon.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordFields extends StatefulWidget {
  const EmailAndPasswordFields(
      {required this.emailController,
      required this.passwordController,
      required this.errors,
      Key? key})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final errors;
  @override
  State<EmailAndPasswordFields> createState() => _EmailAndPasswordFieldsState();
}

class _EmailAndPasswordFieldsState extends State<EmailAndPasswordFields> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        textFieldWidget(
            size: size,
            errorText: widget.errors.emailError,
            prefixIcon: Icons.person,
            labelTextSize: 12,
            controller: widget.emailController,
            labelText: "Your mail",
            keyboardtype: TextInputType.emailAddress),
        textFieldWidget(
            size: size,
            errorText: widget.errors.passwordError,
            labelTextSize: 12,
            prefixIcon: Icons.lock,
            obscureText: _obscureText,
            suffixIcon: passwordSuffixIcon(_obscureText),
            onPressedSuffixIcon: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            controller: widget.passwordController,
            labelText: "Password",
            keyboardtype: TextInputType.visiblePassword)
      ],
    );
  }
}
