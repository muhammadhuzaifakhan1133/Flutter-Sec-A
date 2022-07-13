import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/screens/email_verify/email_verify.dart';
import 'package:todolist/screens/signup/signup_fields_validation.dart';
import 'package:todolist/screens/signup/signup_text_fields_errors.dart';
import 'package:todolist/widgets/loading_widget.dart';

signUp(
    {required setState,
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required SignUpTextFieldErrors errors}) async {
  Fluttertoast.cancel();
  setState(() {
    errors.closeAllErrors();
  });
  bool validFields = signupFieldsValidation(
      setState: setState,
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      errors: errors);
  if (!validFields) {
    return;
  }
  circleProgressDialog(context);
  if (!(await InternetConnectionChecker().hasConnection)) {
    Navigator.of(context, rootNavigator: true).pop();
    Fluttertoast.showToast(msg: "No Internet Connection");
  }
  bool isSignUpSuccess = await addUser(
      context: context,
      setState: setState,
      email: email,
      password: password,
      errors: errors);
  if (!isSignUpSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    return;
  }
  bool emailSent = await sendVerificationEmail(context);
  if (!emailSent) {
    Navigator.of(context, rootNavigator: true).pop();
    return;
  }
  await saveAsActiveUser(name);
  Navigator.of(context, rootNavigator: true).pop();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => EmailVerification(name: name)),
      (route) => false);
}
