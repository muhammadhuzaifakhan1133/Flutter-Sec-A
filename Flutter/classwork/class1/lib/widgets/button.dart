import 'package:class1/constants/color_constants.dart';
import 'package:class1/screens/login/save_login_values.dart';
import 'package:class1/screens/signup/save_signup_values.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

navigateTo(context, goTo, {bool comeBack = true}) {
  if (comeBack) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => goTo),
    );
  } else {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => goTo),
    );
  }
}

buttonWidget(
    {required BuildContext context,
    required text,
    Color text_color = buttonTextColor,
    double text_size = 16.0,
    Color button_color = buttonColor,
    double width = double.infinity,
    double height = 43.0,
    double radius = 12.0,
    Widget? go_to,
    bool validation = false,
    bool isSignup = false,
    bool isLogin = false,
    String? name,
    String? email,
    String? password,
    List<GlobalKey<FormState>>? validation_keys}) {
  return ElevatedButton(
    onPressed: () {
      if (validation) {
        for (var i = 0; i < validation_keys!.length; i++) {
          if (validation_keys[i].currentState!.validate()) {
            if (i == validation_keys.length - 1) {
              if (isSignup) {
                saveSignUpValues(name, email, password);
              } else if (isLogin) {
                saveLoginValues(name, email, password);
              }
              // navigateTo(context, go_to, comeBack: false);
            }
          } else {
            break;
          }
        }
      } else {
        navigateTo(context, go_to);
      }
    },
    child: Text(
      text,
      style: TextStyle(
          wordSpacing: 3,
          color: text_color,
          fontSize: text_size,
          fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        elevation: 10,
        primary: button_color),
  );
}
