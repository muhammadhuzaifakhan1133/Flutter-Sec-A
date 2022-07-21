import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/google_sign_in.dart';
import 'package:todolist/screens/login/horizontal_line.dart';
import 'package:todolist/screens/login/login_process.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButton extends StatefulWidget {
  const FieldsAndButton({Key? key}) : super(key: key);

  @override
  State<FieldsAndButton> createState() => _FieldsAndButtonState();
}

class _FieldsAndButtonState extends State<FieldsAndButton> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LogInTextFieldErrors errors = LogInTextFieldErrors();
  bool obscureText = true;
  dynamic data;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.04),
        textFieldWidget(
            size: size,
            errorText: errors.emailError,
            controller: emailController,
            labelText: "Enter your email",
            keyboardtype: TextInputType.emailAddress),
        textFieldWidget(
          size: size,
          errorText: errors.passwordError,
          obscureText: obscureText,
          controller: passwordController,
          labelText: "Enter your password",
          keyboardtype: TextInputType.visiblePassword,
          suffixIcon: suffixIcon(obscureText),
          onPressedSuffixIcon: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        SizedBox(height: size.height * 0.03),
        buttonWidget(
            size: size,
            text: "Log in",
            onpressed: () async {
              await completeLoginProcess(
                  setState: setState,
                  context: context,
                  email: emailController.text,
                  password: passwordController.text,
                  errors: errors);
            }),
        const SizedBox(height: 15),
        horizontalLine(),
        Stack(
          children: [
            buttonWidget(
                buttonColor: Colors.grey,
                size: size,
                text: "Sign Up with Google",
                onpressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  try {
                    await provider.googleLogin(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }),
            Positioned(
                top: size.height * 0.037,
                left: size.width * 0.09,
                child: const FaIcon(FontAwesomeIcons.google, color: Colors.red))
          ],
        )
      ],
    );
  }
}
