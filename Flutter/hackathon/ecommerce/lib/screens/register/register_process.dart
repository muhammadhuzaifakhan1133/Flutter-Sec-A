import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/email_verify/email_verify.dart';
import 'package:ecommerce/screens/register/feild_errors.dart';
import 'package:ecommerce/screens/register/register_fields_validation.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

registerProcess(
    {required setState,
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required RegisterFieldErrors errors}) async {
  Fluttertoast.cancel();
  setState(() {
    errors.closeAllErrors();
  });
  if (!(await InternetConnectionChecker().hasConnection)) {
    closeDialog(context);
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  bool validFields = registerFieldsValidation(
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
    closeDialog(context);
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  bool isSignUpSuccess = await addUser(
      context: context,
      setState: setState,
      email: email,
      password: password,
      errors: errors);
  if (!isSignUpSuccess) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    return;
  }
  // ignore: use_build_context_synchronously
  bool emailSent = await sendVerificationEmail(context);
  if (!emailSent) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    return;
  }
  await saveAsActiveUser(name);
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => EmailVerificationScreen(name: name)));
}
