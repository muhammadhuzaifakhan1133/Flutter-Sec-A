import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/is_right_provider.dart';
import 'package:todolist/functions/push_and_remove_until.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/login/login_fields_validation.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';
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
  // ignore: use_build_context_synchronously
  closeDialog(context);
  // ignore: use_build_context_synchronously
  pushAndRemoveUntil(context, Home(name: name));
}
