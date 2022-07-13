import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/save_sign_in_as_google.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/provider/google_sign_in.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/login/horizontal_line.dart';
import 'package:todolist/screens/login/login_process.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
import 'package:todolist/screens/push_with_internet_checking/push_with_intenet_checking.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/functions/is_email_valid.dart';
import 'package:todolist/widgets/loading_widget.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButton extends StatefulWidget {
  const FieldsAndButton({Key? key}) : super(key: key);

  @override
  State<FieldsAndButton> createState() => _FieldsAndButtonState();
}

class _FieldsAndButtonState extends State<FieldsAndButton> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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
        SizedBox(height: 15),
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
                    provider.googleLogin(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }),
            Positioned(
                top: size.height * 0.037,
                left: size.width * 0.09,
                child: FaIcon(FontAwesomeIcons.google, color: Colors.red))
          ],
        )
      ],
    );
  }
}
