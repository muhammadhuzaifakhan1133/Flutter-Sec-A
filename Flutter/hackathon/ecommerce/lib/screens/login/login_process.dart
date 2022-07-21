import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/is_right_provider.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:ecommerce/screens/login/feild_errors.dart';
import 'package:ecommerce/screens/login/login_fields_validation.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

completeLoginProcess(
    {required setState,
    required BuildContext context,
    required String email,
    required String password,
    required LoginFieldErrors errors}) async {
  String? name;
  setState(() {
    errors.closeAllErrors();
  });
  Fluttertoast.cancel();
  bool fieldValidated = loginFieldsValidation(
      setState: setState, email: email, password: password, errors: errors);
  if (!fieldValidated) {
    return;
  }
  circleProgressDialog(context);
  if (!(await InternetConnectionChecker().hasConnection)) {
    closeDialog(context);
    Fluttertoast.showToast(msg: "No Internet Connection");
    return;
  }
  if (!(await isRightProvider(
      context: context, email: email, loginWithgoogle: false))) {
    return;
  }
  bool isLoginSuccess = await logIn(
      setState: setState, email: email, password: password, errors: errors);
  if (!isLoginSuccess) {
    // ignore: use_build_context_synchronously
    closeDialog(context);
    return;
  }
  try {
    name = await getUserName(email: email);
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return;
  }
  await saveAsActiveUser(name);
  await setSignInAsGoogleOrNot(false);
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => BottomBarController()));
}
