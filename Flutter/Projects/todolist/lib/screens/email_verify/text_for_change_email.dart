import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/close_dialog.dart';
import 'package:todolist/functions/push_and_remove_until.dart';
import 'package:todolist/functions/remove_active_user.dart';
import 'package:todolist/screens/signup/signup.dart';
import 'package:todolist/widgets/loading_widget.dart';

Row textForChangeEmail(BuildContext context,
    {timer, resendtimer, canResendEmail}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text(
      "Not you?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    InkWell(
        onTap: () async {
          circleProgressDialog(context);
          timer.cancel();
          User? user = FirebaseAuth.instance.currentUser;

          await user?.delete();
          await FirebaseAuth.instance.signOut();
          removeActiveUser();
          if (!canResendEmail) {
            resendtimer?.cancel();
          }
          // ignore: use_build_context_synchronously
          closeDialog(context);
          // ignore: use_build_context_synchronously
          pushAndRemoveUntil(context, const SignUp());
        },
        child: const Text(
          "  change email",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        )),
  ]);
}
