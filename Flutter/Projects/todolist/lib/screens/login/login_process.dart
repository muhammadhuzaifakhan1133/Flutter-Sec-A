import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/is_right_provider.dart';
import 'package:todolist/functions/save_sign_in_as_google.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/login/login_fields_validation.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
import 'package:todolist/screens/push_with_internet_checking/push_with_intenet_checking.dart';
import 'package:todolist/widgets/loading_widget.dart';

completeLoginProcess(
    {required setState,
    required BuildContext context,
    required String email,
    required String password,
    required LogInTextFieldErrors errors}) async {
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
    Navigator.of(context, rootNavigator: true).pop();
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
    Navigator.of(context, rootNavigator: true).pop();
    return;
  }
  try {
    name = await getUserName(email: email);
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return;
  }
  await saveAsActiveUser(name);
  await setSignInAsGoogleOrNot(false);
  Navigator.of(context, rootNavigator: true).pop();
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PushWithCheckingInternet(destination: Home(name: name))),
      (route) => false);
}
